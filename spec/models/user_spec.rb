require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー管理機能テスト' do
    it 'すべての項目を適切に入力した場合はログイン可能' do
      expect(@user).to be_valid
    end
    it 'メールアドレスの入力がない場合はエラー' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが他の人と被っていた場合はエラー' do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid?
      expect(other_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@がない場合はエラー' do
      @user.email = 'aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードがない場合はエラー' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが5文字以下の場合はエラー' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが英語のみの場合エラー' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが数字のみの場合エラー' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '確認用パスワードがない場合はエラー' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '確認用パスワードがパスワードと一致しない場合はエラー' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'bbbbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ニックネームがない場合はエラー' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'ユーザー名(名字)がない場合はエラー' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid.')
    end
    it 'ユーザー名(名前)がない場合はエラー' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid.')
    end
    it 'ユーザー名が漢字・ひらがな・カタカナ以外であればエラー' do
      @user.first_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid.')
    end
    it 'ユーザー名(名字)のフリガナがない場合はエラー' do
      @user.family_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Family kana is invalid.')
    end
    it 'ユーザー名(名前)のフリガナがない場合はエラー' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana is invalid.')
    end
    it 'ユーザーのフリガナが全角カタカナ以外だとエラー' do
      @user.first_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana is invalid.')
    end
    it '生年月日がない場合はエラー' do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
