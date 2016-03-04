# user directed to /games after logging in

get '/games' do
  redirect '/decks'
end

get '/games/:id' do
  @deck = Deck.find(params[:id])
  erb :'/games/show'
end


