::Refinery::Application.routes.draw do
  resources :customers, :only => [:index, :show]
  
  resources :addresses
  
  resources :profiles
  match "account_details" => "profiles#account_details", :as => "account_details"
  match "address_details" => "profiles#address_details", :as => "address_details"
  match "order_history" => "profiles#order_history", :as => "order_history"
  match "order_history_details/:order_number" => "profiles#order_history_details", :as => "order_history_details"
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :customers do
      collection do
        post :update_positions
      end
    end
  end
end
