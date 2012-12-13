Depot::Application.routes.draw do

  resources :slides

  resources :categories

  get "contacts/index"

  get "contacts/update"

  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  match "/slides/pro2slider/:id" => "slides#pro2slider"
  
  get 'register' => 'users#new'
  scope '(:locale)' do
    resources :contacts
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
      get :who_bought, on: :member
      put :decrement, on: :member
      put :increase, on: :member
    end
    root to: 'store#index', as: 'store'
  end
end
