Rails.application.routes.draw do
	get 'posts', to: 'posts#index'
	post 'posts', to: 'posts#create'

	get 'posts/new'

	get 'posts/:id', to: 'posts#show', as: 'post'

	get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post' 

	patch 'posts/:id', to: 'posts#update'

	delete 'posts/:id', to: 'posts#destroy', as: 'destroy_post'

	


	root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
