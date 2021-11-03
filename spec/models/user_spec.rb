require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailが@なしでは登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = 'emailtest'  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email is invalid"
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = ''  # PWの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが5文字以下では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = 'a0000'  # PWの値を5文字以下にする
      user.valid?
      expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角英数字混合での入力でないと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = '000000'  # PWの値を数字のみにする
      user.password_confirmation = '000000'
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation is invalid"
    end

    it 'passwordと、confirmationとが、値が一致での入力でないと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password_confirmation = 'x00000'  # confirmationの値をPWと別にする
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name = ''  # first_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_name = ''  # family_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_name = '111'  # family_nameの値を数字にする
      user.first_name = 'aaa'  # first_nameの値を英字にする
      user.valid?
      expect(user.errors.full_messages).to include "First name is invalid", "Family name is invalid"
    end

    it 'お名前(カナ)は、名字と名前がそれぞれ必須であること。' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_furigana = ''  # first_furiganaの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "First furigana can't be blank"
    end

    it 'お名前(カナ)は、名字と名前がそれぞれ必須であること。' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_furigana = ''  # family_furiganaの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Family furigana can't be blank"
    end

    it 'お名前(カナ)は、全角（カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_furigana = 'あ1a亜'  # family_nameの値をカナ以外にする
      user.first_furigana = 'あ1a亜'  # first_nameの値をカナ以外にする
      user.valid?
      expect(user.errors.full_messages).to include "First furigana is invalid", "Family furigana is invalid"
    end

    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.birthday = ''  # birthdayの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Birthday can't be blank"
    end

    it 'nicknameとemail、passwordとpassword_confirmation,birthday,お名前(全角)とお名前(カナ)は、名字と名前がそれぞれが存在すれば登録できる' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      expect(user).to be_valid
    end

  end
end
