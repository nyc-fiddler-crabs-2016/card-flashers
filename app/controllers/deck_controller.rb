get '/decks' do #decks index page. /decks is the url extension
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'/decks/show'
end
