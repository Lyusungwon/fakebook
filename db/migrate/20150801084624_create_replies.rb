class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|

      t.integer :post_id
      t.integer :user_id
      t.string :content
      t.string :img
      t.string :job
      t.string :ip

      t.timestamps null: false
    end
  end
end
