class ApplicationController < ActionController::API
	include EntityActions
	include Sessions
	include ContestHelper
end
