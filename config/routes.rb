Rails.application.routes.draw do
  resources :posts do
    resources :comments, only:[:create, :destroy]
  end
  devise_for :users
  root 'homes#top'
  get 'top' => 'homes#top'
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
