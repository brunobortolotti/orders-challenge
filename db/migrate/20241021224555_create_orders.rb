class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :customer_id, null: false
      t.string :order_status, null: false
      t.string :payment_status, null: false
      t.string :fulfillment_status, null: false
      t.decimal :total_items_amount
      t.decimal :total_discount_amount
      t.decimal :total_final_amount

      t.timestamps
    end

    add_foreign_key :orders, :customers, column: :customer_id, primary_key: :id
  end
end