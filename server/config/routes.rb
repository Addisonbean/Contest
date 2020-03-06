Rails.application.routes.draw do
	post '/signup', to: 'users#create'
	post '/login', to: 'users#login'
	get '/user', to: 'users#show_current_user'

	post '/contest', to: 'contests#create'
	get '/contest', to: 'contests#show_current_contest'
	get '/contest/problems', to: 'contests#problems_for_current_contest'

	post '/problem', to: 'problems#create'
	get '/problem/:id', to: 'problems#show'

	post '/problem/:id/attempt', to: 'attempts#create'
end
