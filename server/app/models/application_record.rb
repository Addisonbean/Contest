class ApplicationRecord < ActiveRecord::Base
	include ActiveStorageHelper

	self.abstract_class = true
end
