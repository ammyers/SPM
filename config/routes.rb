TestManagement::Application.routes.draw do

  root :to => "pages#login"

  get 'users/my_studies' => 'users#my_studies'
  get 'users/created_studies' => 'users#created_studies'
  get 'users/setup' => 'users#setup'

  get 'studies/join' => 'studies#join'
  get 'studies/leave' => 'studies#leave'
  
  resources :users, :studies

  # routing for authentication
  get 'auth/:provider/callback' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'

  # for testing - DELETE THIS FOR PRODUCTION
  match 'test_login' => 'sessions#test_login' 

end
