Store::Application.routes.draw do
  resources :import_tables
  resources :import_tables do
    resources :people do
      collection { post :search, to: 'people#index' }
      collection { post :edit_multiple }
    end
  end
  post 'import_tables/:id' => 'import_tables#merge'
  post 'people/disqualify' => 'people#disqualify'

  get "csv/import"

  post "csv/import" => 'csv#upload'

  resources :places

  resources :people do
    collection do
      post  :disqualify
      post  :edit_multiple
      put   :update_multiple
      post :search, to: 'people#index' 
    end    
  end
  
  resources :people, only: :index do
    match 'advanced_search' => 'people#advanced_search',
          on: :collection, via: [:get, :post], as: :advanced_search
  end
  

  resources :products
  root to: 'csv#import'
end
