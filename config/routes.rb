Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :ideas
  scope :api do
    resources :users
  end
end
