class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :views
      t.integer :likes

      t.timestamps null: false
    end
  end
end
