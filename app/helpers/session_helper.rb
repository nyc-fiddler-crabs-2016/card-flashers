helpers do

  def logged_in?
    session[:logged_in_id].is_a? Integer
  end
end
