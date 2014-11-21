TestManagement::Application.routes.draw do

  root :to => "pages#login"

  get 'users/login' => 'users#login'
  get 'users/my_studies' => 'users#my_studies'
  get 'users/created_studies' => 'users#created_studies'

  get 'studies/join' => 'studies#join'
  
  resources :users, :studies

  # routing for authentication
  get 'auth/:provider/callback' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'

  # for testing - DELETE THIS FOR PRODUCTION
  match 'test_login' => 'sessions#test_login' 

end
