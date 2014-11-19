TestManagement::Application.routes.draw do

  root :to => "pages#login"

  get 'users/login' => 'users#login'
  get 'users/my_studies' => 'users#my_studies'
  get 'users/created_studies' => 'users#created_studies'
  
  resources :users, :studies

end
