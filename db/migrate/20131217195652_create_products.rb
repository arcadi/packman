class CreateProducts < ActiveRecord::Migration

  def change
    create_table :products do |t|
      t.string :number, limit: 15, null: false
      t.string :name
      t.integer :width, default: 0, null: false
      t.integer :height, default: 0, null: false
      t.integer :depth, default: 0, null: false
      t.integer :weight, default: 0, null: false
      t.integer :stock_level, default: 0, null: false
      t.timestamps
    end

    add_index :products, :number, unique: true

  end

end
