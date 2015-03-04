class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
      t.integer :tournament_id
      t.integer :region_id
      t.integer :status
      t.text :username
      t.text :nickname
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
