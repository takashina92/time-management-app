Rails.application.routes.draw do
  root   'pages#top'
  get    '/sample', to: 'pages#sample'
  get    '/help',      to: 'pages#help'
  get    '/contact',   to: 'pages#contact' 
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/users/:id/destroy_page', to: 'users#destroy_page', as: 'destroy_page'
  
  get    '/tasks/:id/index',           to: 'tasks#index',           as: 'tasks_index'
  get    '/tasks/:id/index_completed', to: 'tasks#index_completed', as: 'tasks_index_completed'
  get    '/tasks/:id/show',            to: 'tasks#show',            as: 'tasks_show'
  post   '/tasks/:id/start',           to: 'tasks#start',           as: 'tasks_start'
  post   '/tasks/:id/stop',            to: 'tasks#stop',            as: 'tasks_stop'
  post   '/tasks/complete',            to: 'tasks#complete',        as: 'complete'
  post   '/tasks/incomplete',          to: 'tasks#incomplete',      as: 'incomplete'
  post   '/tasks',                     to: 'tasks#create'
  delete '/tasks/destroy',             to: 'tasks#destroy'

  resources :users
end
