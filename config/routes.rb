Convomister::Application.routes.draw do

  devise_for :users

  resources :speakers

  root :to => 'b#start'
  #root :to => '/start.html'

  match 'admin', :to => 'access#menu'
  match 'attempt_login', :to => 'access#attempt_login'

  resources :scenarios

  resources :votes

  resources :comments

  match "/scenario/:id", :to => "b#scenario"
  match "/scenarios", :to => "b#scenarios"
  match "/nodes/tree/:id", :to => "nodes#tree"
  match "/nodes/initial", :to => "nodes#initial"
  match "/node/:id", :to => "b#node"
  match "/next_nodes/:id", :to => "b#next_nodes"
  match "/tree/:id", :to => "b#tree"

  resources :nodes

  resources :users

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
