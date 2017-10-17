class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.integer :user_id
      t.integer :post_id
      t.integer :reply_id
      t.boolean :like, default: false

      t.timestamps null: false
    end
  end
end
