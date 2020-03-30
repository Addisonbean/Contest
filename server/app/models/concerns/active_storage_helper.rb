module ActiveStorageHelper

	def path_for_record(record)
		ActiveStorage::Blob.service.path_for(record.key)
	end

end
