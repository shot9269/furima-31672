class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  validates :email, uniqueness: true, format: { with: /@/ }
  validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, confirmation: true
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
