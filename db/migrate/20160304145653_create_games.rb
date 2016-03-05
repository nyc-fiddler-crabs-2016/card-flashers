class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.references :user, index: true
  		t.references :deck, index: true
      t.integer :first_guesses, default: 0

  		t.timestamps null: false

  	end
  end
 end
