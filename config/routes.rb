Rails.application.routes.draw do
  # ユーザー側
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  
  root to: "homes#top"
  get '/about' => 'homes#about'
  get "/search", to: "searches#search"
  
  scope module: :public do
    get 'users/mypage' => 'users#mypage', as:'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe'
    put 'users/information' => 'users#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    get 'users/:id', to: 'users#show', as: 'user'
    
    resources :users do
      resource :relationships, only: [:create, :destroy], path: 'user_relationships'
        get 'followings', to: 'relationships#followings', as: 'followings'
        get 'followers', to: 'relationships#followers', as: 'followers'
    end  
      
    resources :posts do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :favorites, only: [:index]
    
    resources :notifications, only: [:index] do
      member do
        patch :mark_as_read
      end
    end
  end
  
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    get "/search", to: "searches#search"
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update]
    resources :comments, only: [:index,:show, :destroy]
    resources :posts, only: [:show, :index, :destroy]
  end
    devise_scope :admin do
    get '/admin/sign_out', to: 'admin/sessions#destroy'
  end
  
end
