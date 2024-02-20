class Item < ApplicationRecord
  belongs_to :genre
   has_many :order_details

  has_one_attached :image
  enum status: { on_sale: 0, off_sale: 1 }

  validates :name,presence:true
  validates :price,presence:true
end
