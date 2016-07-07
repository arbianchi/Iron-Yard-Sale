class RenameInventoryInventories < ActiveRecord::Migration[5.0]
  def change
    rename_table :inventory, :inventories
  end
end
