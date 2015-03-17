Title::Engine.routes.draw do
  root 'app#index'
  ## post 'app#save'
  # match 'save', :to => 'app#save' , :as => 'save', via: [:post]
  resources :app do
    collection do
      post 'save', as: 'save'
    end
  end
end
