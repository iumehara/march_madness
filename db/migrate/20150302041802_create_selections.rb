class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :team_id
      t.integer :slot_id
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
