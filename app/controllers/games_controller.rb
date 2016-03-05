# user directed to /games after logging in
get '/games' do
  if logged_in?
    redirect '/decks'
  else
    redirect :'/'
  end
end

get '/games/new/:id' do
  if logged_in?
    session.delete(:current_deck)
    session.delete(:messages)
    game = Game.create(user_id: session[:logged_in_id], deck_id: params[:id])
    session[:current_deck] = game.deck.get_ids_of_cards
    redirect "games/#{game.id}"
  else
    redirect :'/'
  end
end

get '/games/complete/:id' do
  if logged_in?
    @game = Game.find(params[:id])
    @stats = @game.judge_them
    erb :'/games/game_complete'
  else
    redirect :'/'
  end
end

get '/games/:id' do
  if logged_in?
    @game = Game.find(params[:id])
    if session[:current_deck] == []
      redirect "/games/complete/#{@game.id}"
    else
      @current_card = Card.find(session[:current_deck].sample)
      erb :'/games/show'
    end
  else
    redirect :'/'
  end
end

post '/games/:id' do
  if logged_in?
    @game = Game.find(params[:id])
    session.delete(:messages)
    if Guess.first_guess?(@game.id, params[:card_id])
      @guess = Guess.create(guess_text:params[:guess_text], game_id:params[:id],card_id:params[:card_id])
      if @guess.correct_guess?
      answered_card = Card.find(params[:card_id])
      session[:current_deck] -= [answered_card.id]
      session[:messages] = "Correct!"
      Game.increment_counter(:first_guesses, @game.id)
      redirect "/games/#{@game.id}"
      else
        session[:messages] = "Incorrect! The answer to the previous question is #{@guess.card.answer}"
        redirect "/games/#{@game.id}"
      end
    else
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
  else
    redirect :'/'
  end
end
