Rails.application.routes.draw do
  resources :games
  resources :players
  post 'players/make' => 'players#create_both'
  get 'players/:id/top_score' => 'players#top_score'
  get '/scoreboard'=> 'games#score_board'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
