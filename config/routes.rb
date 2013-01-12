Purerasmus::Application.routes.draw do
    # Home route.
    root :to  => "home#index"

    # User authentication-flow routes.
    match "/login" => "sessions#new", :as => "login", :via => :get
    match "/login" => "sessions#create", :via => :post
    match "/logout" => "sessions#destroy", :as => "logout"

    match "/universities/new" => "universities#new"
    match "/universities/:university_id" => "pages#show", :via => :get
    match "/universities/:id/photo" => "universities#photo", :as => "university_photo"

    # match "/universities/:id/pages/new" => "pages#new"
    # match "/universities/:id/pages/:page_id/edit" => "pages#edit"
    # match "/universities/:id/pages/:page_id" => "universities#show"
    # match "/universities/:id/pages" => "universities#show"

    # match "/cities/:city_id/pages/new" => "pages#new"
    # match "/cities/:id/pages/:page_id/edit" => "pages#edit"
    # match "/cities/:id/pages/:page_id" => "cities#show"
    # match "/cities/:id/pages" => "cities#show"

    # match "/universities/:id/pages/:page_id/sections/new" => "sections#new"
    # match "/cities/:city_id/pages/:page_id/sections/new" => "sections#new"
    
    # match "/universities/:id/pages/:page_id/sections/:section_id/edit" => "sections#edit"
    # match "/cities/:city_id/pages/:page_id/sections/:section_id/edit" => "sections#edit"


    # Standard controller routes.
    resources :users

	resources :countries do
        resources :cities
        resources :universities
    end

    resources :cities do
        resources :pages

        # This is used to display the topics in a specific city.
        resources :topics do
            
            # This is used to display the comments in a specific topic.
            resources :comments
        end

        resources :universities
    end

    resources :universities do
        resources :pages
    end

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
