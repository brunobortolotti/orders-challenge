class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_column :products, :category_id, :bigint, null: false

    add_foreign_key :products, :categories, column: :category_id, primary_key: :id
  end
end
