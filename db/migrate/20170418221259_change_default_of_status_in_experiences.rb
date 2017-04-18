class ChangeDefaultOfStatusInExperiences < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences, :status, :string, default: 'pending'
  end
end
