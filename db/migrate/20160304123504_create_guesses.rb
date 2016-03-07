class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.string :guess_text, null: false
  		t.references :game, index: true, null: false
  		t.references :card, index: true, null: false

  		t.timestamps null: false
  	end
  end
end

#instead of attribute correct_answer, I think we can just run a guess.method in the model
