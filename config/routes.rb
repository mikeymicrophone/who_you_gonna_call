ActionController::Routing::Routes.draw do |map|
  map.resources :authorizations

  map.resources :services

  map.resources :alias_uses

  map.resources :aliases

  map.resources :establishments

  map.resources :details

  map.resources :parties

  map.resources :guests

  map.resources :rendezvouzs

  map.resources :visits

  map.resources :messages

  map.resources :txts

  map.resources :calls

  map.resources :website_uses

  map.resources :websites

  map.resources :email_uses

  map.resources :emails

  map.resources :address_uses

  map.resources :countries

  map.resources :states

  map.resources :cities

  map.resources :zips

  map.resources :streets

  map.resources :addresses

  map.resources :units

  map.resources :phone_uses

  map.resources :phones

  map.resources :users

  map.resources :people

  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  map.resource :account, :controller => "users"
  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
