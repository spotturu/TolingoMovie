Rails.application.routes.draw do
  resources :list_movies
  root to: "list_movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
