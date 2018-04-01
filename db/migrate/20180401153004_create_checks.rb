class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.date :date
      t.string :number

      t.timestamps
    end
  end
end
