class Card < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  belongs_to :deck

  # def show_question
  #   self.question
  # end

  # def show_answer
  #   self.answer
  # end

end

# <%@game.deck.play_card.show_question%>
