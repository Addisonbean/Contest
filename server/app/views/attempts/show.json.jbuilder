json.attempt do
	json.partial! @attempt
	json.user do
		json.partial! @attempt.user
	end
end
