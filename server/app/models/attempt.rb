require 'fileutils'
require 'open3'
require 'securerandom'

class Attempt < ApplicationRecord
	belongs_to :user
	belongs_to :problem
	belongs_to :contest

	enum status: [:pending, :accepted, :wrong_answer, :runtime_error, :compilation_error]

	has_one_attached :file

	def compile_program
		path = file_path_on_disk
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

	private

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

	def file_path_on_disk
		ActiveStorage::Blob.service.path_for(file.key)
	end

end
