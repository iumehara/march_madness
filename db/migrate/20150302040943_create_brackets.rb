class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
      t.integer :region_id
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
