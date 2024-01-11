class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.decimal :price
      t.integer :quantity
      t.string :title

      t.timestamps
    end
  end
end
