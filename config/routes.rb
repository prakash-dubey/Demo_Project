Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
   get '/login', to: 'home#login'
  resources :addresses
  resources :orders 
  resources :categories do
    resources :subcategories
  end

  resources :charges
  resources :wishlists
  
  #get '/user_wishlists', to: 'wishlists#show'

  post'/user_carts/apply_coupon', to: 'carts#apply_coupon'
  get'/user_carts/remove_coupon', to: 'carts#remove_coupon'
  get '/user_carts', to: 'carts#show'
  get '/user_carts_add', to: 'carts#add_product'
  get '/user_carts_reduce', to: 'carts#reduce_product'
  get '/user_carts_checkout', to: 'carts#checkout'
  delete'/user_carts_remove', to: 'carts#remove_product'
  resources :carts

#   devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end


  # get "/404", :to => "errors#not_found"
  # get "/422", :to => "errors#unacceptable"
  # get "/500", :to => "errors#internal_error"

  #get '/addresses', to: 'addresses#index'

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
