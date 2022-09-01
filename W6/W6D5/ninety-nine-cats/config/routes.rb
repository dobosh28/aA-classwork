Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cats, only: [:index, :create, :edit, :update, :new, :show]
  root to: "cats#index"
end
