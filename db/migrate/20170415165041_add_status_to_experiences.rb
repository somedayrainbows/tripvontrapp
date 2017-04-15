class AddStatusToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :status, :string, default: "active"
  end
end
