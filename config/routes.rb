Rails.application.routes.draw do
  root 'pages#top'
  get    '/help',      to: 'pages#help'
  get    '/contact',   to: 'pages#contact' 
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/users/:id/destroy_page', to: 'users#destroy_page', as: 'destroy_page'
  
  get    '/tasks/:id/show',           to: 'tasks#show',           as: 'tasks_show'
  get    '/tasks/:id/show_completed', to: 'tasks#show_completed', as: 'tasks_completed_show'
  post   '/tasks/complete',           to: 'tasks#complete',       as: 'complete'
  post   '/tasks/incomplete',         to: 'tasks#incomplete',     as: 'incomplete'
  post   '/tasks',                    to: 'tasks#create'
  delete '/tasks/destroy',            to: 'tasks#destroy'

  resources :users
end
