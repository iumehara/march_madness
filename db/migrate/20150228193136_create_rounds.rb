class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :region_id
      t.integer :next_round_id
      t.integer :team_count
      t.boolean :starting_round

      t.timestamps null: false
    end
  end
end
