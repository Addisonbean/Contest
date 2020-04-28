require 'fileutils'
require 'open3'
require 'securerandom'

class Attempt < ApplicationRecord
	belongs_to :user
	belongs_to :problem
	belongs_to :contest

	enum status: [:pending, :accepted, :wrong_answer, :runtime_error, :compilation_error, :waiting_for_judge]

	# TODO: ensure it is an language that the contest accepts (only when it's created right?)
	validates :language, presence: true
	validates :status, presence: true

	has_one_attached :file

	def execute
		cmd = compile_program
		run_program(cmd, path_for_record(problem.test_input))
	end

	def minutes_since_contest_start
		mins = (created_at - contest.start_time) / 1.minutes
		mins.floor
	end

	private

	def compile_program
		path = path_for_record(file)
		case language
		when "python"
			["python3", path]
		when "ruby"
			["ruby", path]
		when "haskell"
			compile(path, "hs") do |input_file, output_file|
				["stack", "ghc", "--", "-O2", "-o", output_file, input_file]
			end
		when "c++"
			compile(path, "cpp") do |input_file, output_file|
				["c++", "-O2", "-o", output_file, input_file]
			end
		when "java"
			compile_java(path, file.filename.to_s)
		end
	end

	def run_program(cmd, input_filename)
		str_cmd = [*cmd, '<', input_filename].join(' ')

		output, exit_status = Open3.capture2e(str_cmd)
		update(runtime_output: output)

		if exit_status.success?
			update(status: :waiting_for_judge)
		else
			update(status: :runtime_error)
		end
	end

	def compile(path, language_extension, &compiler_cmd)
		uuid = SecureRandom.uuid
		source_path = "/tmp/#{uuid}.#{language_extension}"
		binary_path = "/tmp/#{uuid}"

		FileUtils.cp(path, source_path)
		output, status = Open3.capture2e(*compiler_cmd.call(source_path, binary_path))
		FileUtils.rm(source_path)

		update(compilation_output: output)

		if status.success?
			[binary_path]
		else
			update(status: :compilation_error)
			nil
		end
	end

	def compile_java(path, submission_filename)
		# Use a temporary directory in case two submissions have the same class name
		tmp_dir = "/tmp/#{SecureRandom.uuid}"
		source_path = "#{tmp_dir}/#{submission_filename}"

		FileUtils.mkdir(tmp_dir)
		FileUtils.cp(path, source_path)
		output, status = Open3.capture2e("javac", source_path)
		FileUtils.rm(source_path)

		update(compilation_output: output)

		if status.success?
			["java", "-cp", tmp_dir, submission_filename.split('.java')[0]]
		else
			update(status: :compilation_error)
			nil
		end
	end

end
