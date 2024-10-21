class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_type, null: false
      t.string :name, null: false
      t.text :description
      t.decimal :default_price, null: false
      t.decimal :sale_price

      t.timestamps
    end
  end
end
