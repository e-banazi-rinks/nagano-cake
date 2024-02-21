class Item < ApplicationRecord
  belongs_to :genre
  
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items

  has_one_attached :image
  enum status: { on_sale: 0, off_sale: 1 }

  validates :name,presence:true
  validates :price,presence:true
  
  def get_profile_image(width, height)
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
end
