class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  # validates :email, uniqueness: true, format: { with: /@/ }
  # validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, confirmation: true
  # validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  # validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :first_name_kana
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, confirmation: true
  end

end
