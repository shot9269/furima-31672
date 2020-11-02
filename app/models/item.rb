class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:condition,:fee,:area,:send
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :content
    validates :price
    validates :user_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :send_id
  end


end
