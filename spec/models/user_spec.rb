require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it "name、email、password、password_confirmationが入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが入力されていない場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "nameが20文字以下であれば登録できること" do
      user = build(:user, name: 'a' * 20)
      user.valid?
      expect(user).to be_valid
    end
    
    it "nameが21文字以上であれば登録できないこと" do
      user = build(:user, name: 'a' * 21)
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内にしてください")
    end

    it "emailが入力されていない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordが入力されていない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
 
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end
 
    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が入力したパスワードと異なっています。")
    end

    it "重複したemailで登録できないこと" do
      user = create(:user, email: "TestUser@test.com")
      user2 = build(:user, email: "TestUser@test.com")
      user2.valid?
      expect(user2.errors[:email]).to include("は既に使用されています。")
    end
  end
end
