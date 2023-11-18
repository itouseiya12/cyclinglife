require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '新規投稿' do
    it "location、text、postimage、addressが入力されていれば投稿できること"do
      post = create(:post)
      expect(post).to be_valid
    end

    it 'locationが入力されていないと投稿できないこと' do
      post = build(:post, location: nil)
      post.valid?
      expect(post.errors[:location]).to include("を入力してください")
    end

    it 'textが入力されていないと投稿できないこと' do
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    it 'postimageが選択されていないと投稿できないこと' do
      post = build(:post, postimage: nil)
      post.valid?
      expect(post.errors[:postimage]).to include("を選択してください")
    end

    it 'addressが入力されていないと投稿できないこと' do
      post = build(:post, address: nil)
      post.valid?
      expect(post.errors[:address]).to include("を入力してください")
    end
  end
end
