class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:condition,:fee,:area,:send
  belongs_to :user
  has_one_attached :image

  validates :price, numericality: {greater_than: 300, less_than:9999999}

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :price
    validates :user_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :send_id
  end

  with_options numericality: {other_than:1} do
    validates :user_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :send_id
  end


end
