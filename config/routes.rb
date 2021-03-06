Streetclean::Application.routes.draw do
  resources :feedbacks

  resources :authentications

  get "alert/create"

  get "alert/kill"
  
  get "alert/show"

  get "street/phone_carrier"

  get "street/number"
  get "street/intro"

  match 'auth/:provider/callback' => 'authentications#create'
  devise_for :users, :path_name => { :sign_up => "register"}

  get "street/index"
  get "street/show"
  get "street/mobile_home"
  get "street/email"
  get "street/text_message"

  get "locations/locate_car"
  
  # Links
  get "layouts/about_us"
  get "layouts/contact_us"
  get "layouts/feedback"
  get "layouts/feedback_submit"
  get "layouts/tos"
  
  # Feedback
  
  get "feedbacks/index"
  get "feedbacks/edit"
  get "feedbacks/new"
  
  resources :authentications
  

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
  # resources :address

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
   root :to => "street#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
