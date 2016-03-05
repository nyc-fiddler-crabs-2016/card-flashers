get '/decks' do #decks index page. /decks is the url extension
  if logged_in?
    @decks = Deck.all
    erb :'/decks/index'
  else
    redirect :'/'
  end
end

get '/decks/:id' do
  if logged_in?
    @deck = Deck.find(params[:id])
    erb :'/decks/show'
  else
    redirect :'/'
  end
end
