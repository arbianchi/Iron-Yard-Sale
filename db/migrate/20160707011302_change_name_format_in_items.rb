class ChangeNameFormatInItems < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :name, :string
  end
  def down
    change_column :items, :name, :integer
  end
end
