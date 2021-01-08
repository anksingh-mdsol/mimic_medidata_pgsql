# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clinics, :participants, :doctors
  # get '/participants', to:'participants#index'
  # get '/participants/new', to:'participants#new'
  # post '/participants/new', to:'participants#create'
  # get '/participants/:id/show', to:'participants#show'
  # get '/show_me_participants', to: 'participants#show_me_participants'
  resources :clinics do
    resources :arms do 
      resources :participants
    end
  end
  resources :arms do
    resources :participants
  end 
end
