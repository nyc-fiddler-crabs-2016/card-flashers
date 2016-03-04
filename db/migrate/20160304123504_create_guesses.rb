class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.string :guess_text
  		t.references :game, index: true
  		t.references :card, index: true
  		t.boolean :correct_answer?
  		t.integer :attempts
  		t.timestamps null: false
  	end
  end
end
