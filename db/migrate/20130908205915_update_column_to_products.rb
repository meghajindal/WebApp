class UpdateColumnToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :cat_id, :string
    add_column :products , :cat_id,:integer
  end
end
