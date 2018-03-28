class AddRatingToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :rating, :float
  end
end
