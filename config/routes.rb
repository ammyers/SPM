TestManagement::Application.routes.draw do

  root :to => "pages#login"

  # Creates Standard CRUD routes
  resources :users, :studies

  # Users Routes
  get 'users/my_studies' => 'users#my_studies'
  get 'users/created_studies' => 'users#created_studies'
  get 'users/setup' => 'users#setup'
  get 'users/addcourse' => 'users#addcourse'
  get 'users/joincourse' => 'users#joincourse'
  get 'users/leavecourse' => 'users#leavecourse'
  get 'users/admins' => "users#admins"

  # Studies Routes
  get 'studies/join' => 'studies#join'
  get 'studies/leave' => 'studies#leave'
  get 'studies/addstudytime' => 'studies#addstudytime'
  post 'studies/confirm_attendance/:person_id/:time_id', to: "studies#confirm_attendance", as: "studies_confirm_attendance"
  match 'studies/:study_time_id/attendance', to: "studies#attendance", as: "studies_attendance"

  # Authentication Routes
  #     The priority is based upon order of creation:
  #     first created -> highest priority
  #     routing for authentication
  get 'auth/:provider/callback' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'

  # for testing - DELETE THIS FOR PRODUCTION
  match 'test_login' => 'sessions#test_login' 

end
