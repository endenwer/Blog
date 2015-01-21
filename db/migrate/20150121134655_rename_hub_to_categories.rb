class RenameHubToCategories < ActiveRecord::Migration
  def change
    rename_table :hubs, :categories
  end
end
