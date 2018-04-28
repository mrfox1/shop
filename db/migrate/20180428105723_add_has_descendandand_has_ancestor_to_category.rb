class AddHasDescendandandHasAncestorToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :hasDescendands, :boolean
    add_column :categories, :hasAncestor, :boolean
  end
end
