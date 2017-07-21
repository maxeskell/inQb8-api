Rails.application.routes.draw do

  scope :api do
    resources :users
    resources :tags
    resources :comments
    resources :ideas
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github'
    post 'oauth/facebook'
  end

end
