class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.bigint :order_id, null: false
      t.bigint :product_id, null: false
      t.integer :quantity
      t.decimal :product_unit_price
      t.decimal :discount_amount
      t.decimal :total_amount

      t.timestamps
    end

    add_foreign_key :order_items, :orders, column: :order_id, primary_key: :id
    add_foreign_key :order_items, :products, column: :product_id, primary_key: :id
  end
end
