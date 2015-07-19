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

  resources :items do
    resources :images, except: [:show, :edit]
  end

  resources :categories, only: [:create, :update, :destroy]

  resources :keywords, only: [:create, :update, :destroy]

  # add 404 page
  get '/*path' => 'welcome#error'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
