class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :round_id
      t.integer :next_game_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps null: false
    end
  end
end
