class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
