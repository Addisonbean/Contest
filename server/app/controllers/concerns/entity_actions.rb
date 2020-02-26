module EntityActions

	def try_save(entity)
		if !entity.save
			@errors = entity.errors.messages
			render 'shared/error', status: :bad_request
			return false
		end
		return true
	end

	def assert_not_nil(entity)
		if entity.nil?
			@msg = "Entity not found"
			render 'shared/error', status: :not_found
			return false
		end
		return true
	end

	def try_show(entity)
		if assert_not_nil(entity)
			render 'show'
		end
	end

end
