class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :description
      t.integer :cost
      t.string :city

      t.timestamps null: false
    end
  end
end
