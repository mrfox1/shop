class CreateDescendantCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :descendant_categories do |t|
      t.integer :parent
      t.belongs_to :category, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
