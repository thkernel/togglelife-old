Rails.application.routes.draw do
  resources :blockings
  resources :notifications
  resources :favoris
  resources :flirts
  get 'cgu' => "pages#cgu", as: :cgu
  get 'cookies' => "pages#cookies", as: :cookies
  get 'advertise' => "pages#advertise", as: :advertise
  get 'send/flirt/request/:slug' =>  "flirts#send_flirt", as: :send_new_flirt
  get 'accept/flirt/request/:identifier' =>  "flirts#accept_flirt", as: :accept_flirt
  get 'remove/flirt/request/:identifier' =>  "flirts#remove_flirt", as: :remove_flirt
  get 'add/favoris/request/:slug' =>  "favoris#add_to_favoris", as: :add_to_favoris
  get 'remove/favoris/request/:identifier' =>  "favoris#remove_to_favoris", as: :remove_to_favoris

  #get 'policy'
  resources :messages
  resources :conversations
  # Default routes.
  #root 'home#index'

  get 'home' => 'profiles#index', as: :profile


  # For profiles resources.
  get "/me/:slug" => "profiles#show_his_profile", as: :show_my_profile # After i would replace :login by slug
  get "/me/:slug/presentation" => "profiles#profile_presentation", as: :get_profile_presentation # After i would replace :login by slug
  #post "/me/:slug/presentation" => "profiles#update_profile_presentation", as: :post_profile_presentation # After i would replace :login by slug
  patch "/me/:slug/presentation" => "profiles#update_profile_presentation", as: :update_profile_presentation # After i would replace :login by slug
  get "/me/:slug/informations" => "profiles#profile_informations", as: :get_profile_informations # After i would replace :login by slug
  patch "/me/:slug/informations" => "profiles#update_profile_informations", as: :update_profile_informations # After i would replace :login by slug
  get "/me/:slug/thumbnail" => "profiles#profile_thumbnail", as: :get_profile_thumbnail # After i would replace :login by slug
  patch "/me/:slug/thumbnail" => "profiles#update_profile_thumbnail", as: :update_profile_thumbnail # After i would replace :login by slug

  #get "update/me/:slug" => "profiles#show_his_profile", as: :show_my_profile # After i would replace :login by slug

  get "/profile/:slug" => "profiles#show_his_profile", as: :show_his_profile # After i would replace :login by slug
 # get "update/profile/:slug" => "profiles#show_his_profile", as: :show_his_profile # After i would replace :login by slug

  get "message/new/:recipient_id/" => "messages#new", as: :send_new_message
  get "messages/:identifier/:slug/" => "messages#show", as: :show_messages
  post "message/create/:recipient_id/" => "messages#create", as: :create_message
  
  
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/registrations#new', as: :unauthenticated_root
    end
  end

  #devise_for :users

  devise_for :users, path: '', controllers: { 
            registrations: "users/registrations",
            confirmations: 'users/confirmations',
            passwords: "users/passwords",
            sessions: "users/sessions"
            
        }, 
        path_names: {
            sign_in: 'login', 
            sign_out: 'logout', 
            password: 'secret', 
            confirmation: 'verification', 
            unlock: 'unblock', 
            registration: 'signup', 
            sign_up: '' ,
            omniauth_callbacks: 'users/omniauth'
        }



		# Dynamic error pages
		get "/404", to: "errors#not_found"
		get "/422", to: "errors#unacceptable"
		get "/500", to: "errors#internal_error"
end
