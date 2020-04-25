Rails.application.routes.draw do
	post '/signup', to: 'users#create'
	post '/login', to: 'users#login'
	get '/user', to: 'users#show_current_user'

	post '/contest', to: 'contests#create'
	post '/contest/update', to: 'contests#update'
	get '/contest', to: 'contests#show_current_contest'
	get '/contest/problems', to: 'contests#problems_for_current_contest'
	get '/contest/:id', to: 'contests#show'

	get '/scoreboard', to: 'contests#scoreboard'

	post '/problem', to: 'problems#create'
	get '/problem/:id', to: 'problems#show'
	post '/problem/:id/edit', to: 'problems#edit'

	post '/problem/:id/attempt', to: 'attempts#create'

	# TODO: nest these routes under /problem/:problem_id
	post '/attempt/:id/grade', to: 'attempts#grade'
	get '/attempt/:id', to: 'attempts#show'
	get '/attempts', to: 'attempts#all_for_current_contest'
end
