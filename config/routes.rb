Rails.application.routes.draw do
  resources :posts do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  devise_for :users
  root 'homes#top'
  get 'top' => 'homes#top'
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :favorites
      get :comments
    end
  end
end
