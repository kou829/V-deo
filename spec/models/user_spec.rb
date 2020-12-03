require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    context "ユーザ登録できる場合" do

      it "nickname、email、password、introductionが存在する時" do
        expect(@user).to be_valid
      end

    end

    context "ユーザ登録できなかった場合" do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do 
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "introductionが空では登録できない" do
        @user.introduction = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Introduction can't be blank"
      end
      it "emailに＠が存在しないと登録できない" do
        @user.email = "sasa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordの桁数が６桁以上ないと登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

    end
  end
end

# bundle exec rspec spec/models/user_spec.rb
# @user.errors
# @user.errors.full_messages