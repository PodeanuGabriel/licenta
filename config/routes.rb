
Server::Application.routes.draw do
  
  resources :filters


  resources :user_sessions
  resources :favorites
  resources :coupons
  resources :categories
  resources :transactions
  resources :companies
  resources :users

  root :to => 'index#show'

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'

  match '/all_categories', :to => 'categories#all_categories'

  match '/show_coupon', :to => 'coupons#index'
  match '/get_coupons', :to => 'coupons#get_coupons'
  match '/get_coupon_details', :to => 'coupons#get_coupon_details'
  match '/get_map_coupon_details', :to => 'coupons#get_map_coupon_details'

  match '/show_company', :to => 'companies#index'

  match '/register', :to => 'users#new'

  match '/home' , :to => 'index#show'

  match '/claim_coupon', :to => 'transactions#claim_coupon'
  match '/savings_show', :to => 'transactions#savings_show'

  match '/favorite_coupon', :to => 'transactions#favorite_coupon'
  match '/favorite_remove', :to => 'transactions#favorite_remove'
  match '/favorites_show', :to => 'transactions#favorites_show'

  match '/get_filters', :to => 'filters#get_filters'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
