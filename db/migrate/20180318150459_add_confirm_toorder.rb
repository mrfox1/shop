class AddConfirmToorder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :confirm, :boolean
  end
end
