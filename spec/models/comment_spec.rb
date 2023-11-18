require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe '新規コメント' do
    it "コメント文を入力済みであれば保存できる" do
      expect(@comment).to be_valid
    end
  end
end
