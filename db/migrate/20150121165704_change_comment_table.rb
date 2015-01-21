class ChangeCommentTable < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.change :likes, :integer, default: 0
    end
  end
  def self.down
    change_table :comments do |t|
      t.change :likes, :integer
    end
  end
end
