Rails.application.routes.draw do
  root to: 'posts#index'  
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'post#checked'
end