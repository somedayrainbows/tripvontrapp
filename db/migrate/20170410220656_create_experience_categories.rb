class CreateExperienceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_categories do |t|
      t.references :category, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps null: false
    end
  end
end
