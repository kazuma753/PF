class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :comment_id
      t.text :comment
      t.timestamps
    end
  end
end
