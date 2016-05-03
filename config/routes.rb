Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root   'albums#index'

  get    '/albums' => 'albums#index', as: 'albums' # 3rd part is a named route. lets rails 
  # figure out which one of our routes is for our form
  post   '/albums' => 'albums#create' 
  get    '/albums/new' => 'albums#new'
  get    '/albums/:id' => 'albums#show', as: 'album'  #individual album's details
  # name the album route so that it can be used to dynamically generate path 
  # in link to specific album info

  delete '/albums/:id' => 'albums#destroy'
  get    '/albums/:id/edit' => 'albums#edit'
  patch  '/albums/:id' => 'albums#update'

  resources :users, :only => [:new, :create]

  # get    '/albums/by_year/:year' => 'albums#by_year' # might reuse a view from a prev action, 
  # but it would get its own method in the controller


  # get '/:artist' => 'albums#by_artist' # not following RESTful convention b/c
  # it doesn't identify to the user what kind of data they're retrieving

  # get '/artists/:artist' => 'albums#by_artist'
  
  # get "/" => "home#index"  
  # # same as root 'welcome#index'

  # get "/rosa" => "home#rosa"  
  # # picks the first one it matches, so this must go before the general "/:name"

  # get "/:name" => "home#index"  
  # # dynamic parameter.   

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
