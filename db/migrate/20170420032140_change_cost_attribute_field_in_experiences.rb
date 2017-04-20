class ChangeCostAttributeFieldInExperiences < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences, :cost, :float
  end
end
