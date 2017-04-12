class AddImagePathToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :image_path, :string
  end
end
