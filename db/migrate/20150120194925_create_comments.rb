class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user_id
      t.string :post_id
      t.integer :likes

      t.timestamps null: false
    end
  end
end
