Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'users/index'
  get 'user/index'
  root to: "items#index"
end
