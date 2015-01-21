class ChangePostTable < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.change :likes, :integer, default: 0
      t.change :views, :integer, default: 0
    end
  end
  def self.down
    change_table :posts do |t|
      t.change :likes, :integer
      t.change :views, :integer
    end
  end
end
