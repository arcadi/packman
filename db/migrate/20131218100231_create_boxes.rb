class CreateBoxes < ActiveRecord::Migration

  def change
    create_table :boxes do |t|
      t.string :name, null: false
      t.integer :volume, null: false, default: 0
      t.timestamps
    end
  end

end
