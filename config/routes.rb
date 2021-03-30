Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create]
  end
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :delete
end
