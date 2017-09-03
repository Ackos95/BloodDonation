Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'auth/registrations' }


  # static routes
  get '/donors', to: 'index#donor_database', as: 'donor_database'
  get '/contact', to: 'index#contact', as: 'contact'

  scope :api do
    scope :v1 do
      get '/search', to: 'api/v1/search#search', as: 'search'
    end
  end

  # Unauthenticated users can see profile

  authenticated :user do
    get '/profile', to: 'user#show', as: 'my_profile'
    get '/profile/edit', to: 'user#edit', as: 'profile_edit'

    get '/certificate', to: 'user#pdf_certificate', as: 'pdf_cert'

    # admin only can see all donations
    get '/donations/all', to: 'donation#index', as: 'all_donations'
    get '/donations/for_check', to: 'donation#for_check', as: 'donations_for_check'
    post '/donations/:id/check', to: 'donation#check', as: 'check_donation'
    
    get '/donations', to: 'donation#user_donations', as: 'donation_history'
    post '/schedule', to: 'donation#create', as: 'schedule_create'

    # Aliases so that admin can see/edit user information
    get '/users/:user_id/profile', to: 'user#show', as: 'user_profile'
    get '/users/:user_id/edit', to: 'user#edit', as: 'user_profile_edit'
    put '/users/:user_id/update', to: 'user#update', as: 'user_profile_update'
    get '/users/:user_id/donations', to: 'donation#user_donations', as: 'user_donations'
  end

  root 'index#index'
end
