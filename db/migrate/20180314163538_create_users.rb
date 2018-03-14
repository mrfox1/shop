class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :sname
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :country
      t.string :city
      t.string :street
      t.integer :number
      t.integer :appartament
      t.string :postindex

      t.timestamps
    end
  end
end
