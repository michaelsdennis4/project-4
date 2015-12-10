Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#index'

  get '/about' => 'welcome#about'

  get '/admin' => 'welcome#admin'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]

  patch '/change_password' => 'users#change_pw'

  resources :users, except: [:show]

  patch '/items/:id/toggle_category/:category_id' => 'items#toggle_cat'
  patch '/items/:id/toggle_keyword/:keyword_id' => 'items#toggle_key'

  patch '/set_thumb/:item_id' => 'items#set_thumb'

  resources :categories, only: [:create, :update, :destroy] do
    resources :items, only: [:index, :show]
  end

  resources :keywords, only: [:create, :update, :destroy]

  resources :items do
    resources :images, except: [:show, :edit]
  end

  # add 404 page
  get '/*path' => 'welcome#error'

end
