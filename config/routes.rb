Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  post :incoming, to: 'incoming#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
