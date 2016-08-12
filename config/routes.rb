Rails.application.routes.draw do
  root 'todos#index'
  resources :todos do
    resources :todo_items, except: [:new, :edit] do
      member do
        patch :complete
      end
    end
  end
end
