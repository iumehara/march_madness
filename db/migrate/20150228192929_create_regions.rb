class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :tournament_id
      t.string :name
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
