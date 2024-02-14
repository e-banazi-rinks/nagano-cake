Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'homes/top'
    resources :orders, only: [:show, :update] do
      resources :order_details, only:[:update]
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :show,]
    post 'orders/confirm', as:'confirm'
    get 'orders/thanks', as:'thanks'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all', as:'destroy_all'
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
