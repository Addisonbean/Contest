json.extract! attempt, :id, :status, :language, :created_at, :runtime_output

json.file do
	json.filename attempt.file.filename.to_s
	json.data attempt.file.download
end
