Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shorturls
  root :to => 'shorturls#index'
  get "redirect" => "shorturls#redirect"
end
