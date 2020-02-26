json.problems do
	json.array! @problems, :id, :title
end
