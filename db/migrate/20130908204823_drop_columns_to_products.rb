class DropColumnsToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :string, :string
    remove_column :products, :integer, :string
  end
end
