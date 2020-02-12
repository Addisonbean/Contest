Rails.application.routes.draw do
	post '/signup', to: 'users#create'
	post '/login', to: 'users#login'
	get '/user', to: 'users#show_current_user'
end
