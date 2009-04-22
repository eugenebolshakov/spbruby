ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  map.resources :subscriptions

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
