class AddUserIdToCheck < ActiveRecord::Migration[5.0]
  def change
    add_column :checks, :user_id, :integer
  end
end
