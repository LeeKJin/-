Rails.application.routes.draw do
  devise_for :users
  
  
  root 'main#index'
  
  get '/index' => 'main#index'

  get '/introduce' => 'main#introduce'
  
  get '/self1' => 'main#self1'
  
  get '/self_action' => 'main#self_action'
  
  get '/self2' => 'main#self2'
  
  get '/self3' => 'main#self3'
  
  get '/self_result' => 'main#self_result'
  
  get 'self_result_action' => 'main#self_result_action'
  
  get '/mtm' => 'main#mtm'
  
  get '/search' => 'main#search'
  
  get '/history_action/:q_id' => 'main#history_action'
  
  get '/history' => 'main#history'
  
  get '/mtm_write' => 'main#mtm_write'
  
  get '/mtm_write_action' => 'main#mtm_write_action'
  
  get '/mtm_read/:num' => 'main#mtm_read'
  
  get '/mtm_update/:num' => 'main#mtm_update'
  get '/mtm_delete/:num' => 'main#mtm_delete'
  get '/mtm_update_action/:num' => 'main#mtm_update_action'
  
  get '/comment/mtm_create/:num' => 'comment#mtm_create'
  get '/comment/mtm_delete/:c_id/:p_id' => 'comment#mtm_delete'
  
  get '/warning' => 'main#warning'
  
  get '/hospital' => 'main#hospital'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
