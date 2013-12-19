class AddUniquenessToBoxes < ActiveRecord::Migration

  def up
    change_column :boxes, :name, :string, limit: 100, null: false
    add_index :boxes, :name, unique: true
  end

  def down
    change_column :boxes, :name, :string, limit: 255, null: false
    remove_index :boxes, :name
  end

end
