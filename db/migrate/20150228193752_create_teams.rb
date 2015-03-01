class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :region_id
      t.integer :seed

      t.timestamps null: false
    end
  end
end
