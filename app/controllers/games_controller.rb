# user directed to /games after logging in


get '/games' do
  redirect '/decks'
end

get '/games/:id' do
  @game = Game.create(user_id: session[:logged_in_id], deck_id: params[:id])
  erb :'/games/show'
end

