class RemoveColumnFromExperiencesOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :experiences_orders, :title, :string
    remove_column :experiences_orders, :description, :string
    remove_column :experiences_orders, :cost, :integer
  end
end
