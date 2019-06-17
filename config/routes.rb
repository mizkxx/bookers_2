Rails.application.routes.draw do
	get '/' => 'booker#home'
  devise_for :users
  root 'books#index' #ログイン後リダイレクトするページを記載 user_path(current_user.id)
  resources :users, only: [:show, :edit, :update, :index]
  #resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/booker/home' => 'booker#home'
  get '/booker/about' => 'booker#about'
end
