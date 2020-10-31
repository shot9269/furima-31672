class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :nickname
      validates :first_name
      validates :last_name
      validates :first_name_kana
      validates :last_name_kana
      validates :birthday
    end

    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,messages:"Full-width characters"}  do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,message:"Full-width katakana characters" } do
      validates :first_name_kana
      validates :last_name_kana
    end
  
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,message:"Include both letters and numbers"}, confirmation: true
  

end








