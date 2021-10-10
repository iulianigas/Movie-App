Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users 
  resources :movies do
    resources :reviews
  end
  root :to => "movies#index"
  get "statistics", to:"movies#statistics"
  get "search", to:"movies#search"
  get "ranking", to:"movies#ranking"
end