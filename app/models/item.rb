class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :fee, :area, :send
  belongs_to :user
  has_many :order
  has_one_attached :image

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

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :send_id
  end
  validates :price, format: { with: /[1-9]/, message: 'half-width number' }, numericality: { greater_than: 300, less_than: 9_999_999, message: 'out of setting range' }
end
