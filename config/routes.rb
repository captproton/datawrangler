Store::Application.routes.draw do
  resources :import_tables
  resources :import_tables do
    resources :people, :places, :products
  end
  post 'import_tables/:id' => 'import_tables#merge'


  get "csv/import"

  post "csv/import" => 'csv#upload'

  resources :places

  resources :people

  resources :products
  root to: 'csv#import'
end
