Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root :to => "ideas#index"

	resources :ideas, only: [:index, :show, :new, :create, :edit, :update, :destroy]

	get '/upvote/:id', to: 'ideas#upvote', as: :upvote

end
