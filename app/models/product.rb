class Product < ActiveRecord::Base
  belongs_to :user
  validates :prod_name, presence: true, length: { maximum: 200 }
  validates :cat_id, presence: true
  validates :user_id, presence:true

end
