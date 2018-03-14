class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :product_id, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
