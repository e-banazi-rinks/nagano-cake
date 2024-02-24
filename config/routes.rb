Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :customer do
  get 'customers/sign_out', to: 'public/sessions#destroy'
end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}, path: 'admin', path_names: {sign_out: 'logout' }

devise_scope :admin do
  get 'admin/logout', to: 'admin/sessions#destroy'
end

  namespace :admin do
    root to: 'homes#top'
    resources :orders, only: [:show, :update] do
      resources :order_details, only:[:update]
    end
    resources :genres, only: [:index, :show,:create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
     post 'orders/confirm', as:'confirm'
    get 'orders/thanks', as:'thanks'
    resources :orders, only: [:new, :index, :show, :create]
    get 'customers/unsubscribe', as:'unsubscribe'
    patch 'customers/withdraw', as:'withdraw'
    resources :customers, only: [:show, :edit, :update]
    delete 'cart_items/destroy_all', as:'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
