Rails.application.routes.draw do
  get 'items/index'
  get 'users/index'
  get 'user/index'
  root to: "items#index"
end
