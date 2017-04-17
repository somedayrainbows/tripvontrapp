class AddDefaultValueToOrdersForStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :status, :string, default: "Ordered"
  end
end
