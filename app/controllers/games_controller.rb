# user directed to /games after logging in


get '/games' do
  redirect '/decks'
end

get '/games/new/:id' do
  session.delete(:current_deck)
  session.delete(:messages)
  game = Game.create(user_id: session[:logged_in_id], deck_id: params[:id])
  session[:current_deck] = game.deck.get_ids_of_cards
  redirect "games/#{game.id}"
end

get '/games/complete/:id' do
  @game = Game.find(params[:id])
  @stats = @game.percent_accurate
  erb :'/games/game_complete'
end

get '/games/:id' do
  @game = Game.find(params[:id])
  if session[:current_deck] == []
    redirect "/games/complete/#{@game.id}"
  else
    @current_card = Card.find(session[:current_deck].sample)
    erb :'/games/show'
  end
end

post '/games/:id' do
  @game = Game.find(params[:id])
  session.delete(:messages)
  @guess = Guess.create(guess_text:params[:guess_text], game_id:params[:id],card_id:params[:card_id])
  if @guess.correct_guess?
    answered_card = Card.find(params[:card_id])
    session[:current_deck] -= [answered_card.id]
    session[:messages] = "Correct!"
    redirect "/games/#{@game.id}"
  else
    session[:messages] = "Incorrect! The answer to the previous question is #{@guess.card.answer}"
    redirect "/games/#{@game.id}"
  end
end
