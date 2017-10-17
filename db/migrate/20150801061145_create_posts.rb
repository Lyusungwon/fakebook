class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :writer_id
      t.integer :receiver_id
      t.string :nickname
      t.string :password
      t.string :content
      t.string :img
      t.string :imgfile
      t.string :ip

      t.timestamps null: false
    end
  end
end
