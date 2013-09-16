class Product < ActiveRecord::Base



  belongs_to :user
  has_many :area
  has_many :transactions
  has_many :users, :through => :transactions
 # validates :prod_name, presence: true, length: { maximum: 200 }

  validates :user_id, presence:true


end
