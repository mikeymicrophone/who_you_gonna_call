ActionController::Routing::Routes.draw do |map|
  map.resources :authorizations, :has_one => [:user, *Authorization.targets(:symbol)]

  map.resources :services, :has_many => [:aliases, :alias_uses, :messages, :address_uses, :addresses, :units, :details, :phone_uses, :phones, :website_uses, :people]

  map.resources :alias_uses, :has_one => [:alias, *AliasUse.targets(:symbol)]

  map.resources :aliases, :has_one => :service, :has_many => [:alias_uses, :details, :website_uses, :websites]

  map.resources :establishments, :has_many => [:rendezvouzs, :visits, :parties, :guests, :address_uses, :addresses, :calls, :details, :email_uses, :emails, :alias_uses, :aliases, :phone_uses, :phones, :website_uses, :websites]

  map.resources :details, :has_one => Detail.targets(:symbol), :has_many => [:authorizations, :users, :website_uses, :websites]

  map.resources :parties, :has_one => Party.targets(:symbol), :has_many => [:guests, :address_uses, :addresses, :units, :details, :website_uses, :websites]

  map.resources :guests, :has_one => [:person, *Guest.targets(:symbol)], :has_many => [:details]

  map.resources :rendezvouzs, :has_one => Rendezvouz.targets(:symbol), :has_many => [:address_uses, :addresses, :units, :details, :guests, :website_uses, :websites]

  map.resources :visits, :has_one => Visit.targets(:symbol), :has_many => :guests

  map.resources :messages, :has_one => [:service, :person], :has_many => [:details, :website_uses, :websites]

  map.resources :txts, :has_one => :phone, :has_many => :details

  map.resources :calls, :has_one => Call.targets(:symbol), :has_many => :details

  map.resources :website_uses, :has_one => [:website, *WebsiteUse.targets(:symbol)], :has_many => [:details, :phone_uses]

  map.resources :websites, :has_many => [:website_uses, :address_uses, :addresses, :details, :phone_uses, :phones]

  map.resources :email_uses, :has_one => [:email, *EmailUse.targets(:symbol)]

  map.resources :emails, :has_many => [:email_uses, :details, :website_uses, :websites]

  map.resources :address_uses, :has_one => [:address, :unit, *AddressUse.targets(:symbol)], :has_many => [:parties, :phone_uses, :phones, :rendezvouzs, :website_uses, :websites, :visits, :guests]

  map.resources :countries, :has_many => [:states, :cities, :zips, :details, :website_uses, :websites, :visits, :guests]

  map.resources :states, :has_one => :country, :has_many => [:cities, :zips, :streets, :details, :email_uses, :emails, :website_uses, :websites, :visits, :guests]

  map.resources :cities, :has_one => [:state, :country], :has_many => [:streets, :zips, :addresses, :details, :email_uses, :emails, :phone_uses, :phones, :website_uses, :websites, :visits, :guests, :units]
  
  map.resources :zips, :has_one => [:city, :state, :country], :has_many => :addresses
  
  map.resources :streets, :has_one => [:city], :has_many => [:addresses, :details, :parties, :rendezvouzs, :website_uses, :websites, :visits, :guests]
  
  map.resources :addresses, :has_many => [:details, :parties, :phone_uses, :phones, :rendezvouzs, :website_uses, :websites, :visits, :address_uses], :has_one => [:street, :zip]
  
  map.resources :units, :has_one => :address, :has_many => [:address_uses, :details, :parties, :phone_uses, :phones, :rendezvouzs, :website_uses, :websites, :visits, :guests]
  
  map.resources :phone_uses, :has_one => [:phone, *PhoneUse.targets(:symbol)], :has_many => [:calls, :details]
  
  map.resources :phones, :has_many => [:phone_uses, :calls, :address_uses, :addresses, :authorizations, :details, :website_uses, :websites]
  
  map.resources :users, :has_many => [:details, :people, :addresses, :address_uses, :aliases, :alias_uses, :authorizations, :calls, :cities, :countries, :details, :emails, :email_uses, :establishments, :guests, :messages, :parties, :phones, :phone_uses, :rendezvouzs, :services, :states, :streets, :txts, :units, :visits, :websites, :website_uses, :zips]
  
  map.resources :people, :has_one => :user, :has_many => [:phone_uses, :phones, :email_uses, :emails, :address_uses, :addresses, :website_uses, :websites, :alias_uses, :aliases, :authorizations, :calls, :details, :visits, :guests, :services]

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
