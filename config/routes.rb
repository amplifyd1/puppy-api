Rails.application.routes.draw do
    resources :posts do
      resources :likes
    end
    resources :users do
      resources :posts
      reources :likes
    end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
