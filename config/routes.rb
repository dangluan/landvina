RailsApp::Application.routes.draw do

  delete '/lands/:id/delete_photo', controller: :lands, action: :delete_photo

  post '/lands/upload_album', controller: :lands, action: :upload_album

  put '/lands/update_ruby_gallery_position', controller: :lands, action: :update_ruby_gallery_position

  devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  scope "/admins" do
    root :to => "dashboard#index"
    get "/dashboard/home", controller: :dashboard, action: :home
    resources :lands do
      member do
        get :upload_preview
      end
    end
  end
  
  get '/clients/new_contact', controller: :clients, action: :new_contact
  get '/clients/feed_back', controller: :clients, action: :feed_book
  get '/clients/:id/land_detail', controller: :clients, action: :land_detail
  get '/clients/:id/show_map', controller: :clients, action: :show_map
  get '/clients/index', controller: :clients, action: :index
  get '/clients/home', controller: :clients, action: :home
  root :to => "clients#home"
  
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
