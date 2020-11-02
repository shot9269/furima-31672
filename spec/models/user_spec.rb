require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it 'nickname,email,password,first_name,last_name,first_name_kana,last_name_kana,birthdayが入力されている' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かない行く時' do
      it 'emailがデータベースに存在する' do
        @user.email = '111@com'
        @user.save
        user2 = User.new(nickname: 'take', email: '111@com', password: 'feS213', password_confirmation: 'feS213', first_name: '田中', last_name: '将大', first_name_kana: 'タナカ', last_name_kana: 'マサヒロ', birthday: '1999-11-11')
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない' do
        @user.email = '111com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だったら'do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        
      end
      it 'passwrordが６文字以下' do
        @user.password = 'sdf11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英数字以外が含まれる' do
        @user.password = 'sdf$$'
        @user.password_confirmation = 'sdf$$'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordに英字のみ' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが数字のみ' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      
      it 'password_confirmationがpasswordと違う' do
        @user.password = 'shota0609'
        @user.password_confirmation = 'shota123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが入力されていない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが入力されていない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.first_name = 'shota'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが入力されていない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.last_name = 'shota'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_kanaが入力されていない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角（カタカナ）で入力されていない' do
        @user.first_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'last_name_kanaが入力されていない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角（カタカナ）で入力されていない' do
        @user.last_name_kana = '雄太'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it '生年月日が入力されていない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
