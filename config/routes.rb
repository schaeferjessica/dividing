Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :groups do
    resources :activity_costs
    resources :members, only: [:new, :create]
  end

  resources :activity_costs do
    resources :splits
  end
end
