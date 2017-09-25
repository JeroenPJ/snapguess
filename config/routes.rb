Rails.application.routes.draw do
  devise_for :users

  resources :guesses, except: [:show]

  get 'correct', to: 'pages#correct'
  get 'incorrect', to: 'pages#incorrect'

  get 'leaderboard', to: 'pages#leaderboard'
  root to: 'pages#home'
end
