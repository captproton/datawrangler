Store::Application.routes.draw do
  resources :import_tables
  resources :import_tables do
    resources :people, :places, :products
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
    end
    
  end

  resources :products
  root to: 'csv#import'
end
