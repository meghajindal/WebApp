class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, :force => true do |t|
      t.string :prod_name

      t.integer :cat_id
      t.integer :user_id
      t.text :area

      t.timestamps
    end
  end
end
