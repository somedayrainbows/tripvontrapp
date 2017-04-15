class CreateExperiencesOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences_orders do |t|
      t.string :title
      t.string :description
      t.integer :cost
      t.integer :quantity
      t.integer :subtotal
      t.references :order, index: true, foreign_key: true
      t.references :experience, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
