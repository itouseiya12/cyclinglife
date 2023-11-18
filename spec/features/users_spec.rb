require 'rails_helper'

RSpec.describe "Users", type: :feature do
  let!(:user){ create(:user) }
  let!(:post){ create(:post, user: user) }
  let!(:comment){ create(:comment, user: user, post: post)}

  describe 'マイページ' do
    before do
      visit new_user_session_path
      fill_in "Eメール", with: user.email
      fill_in "パスワード", with: user.password
      click_on('ログイン') 
      visit user_path(user)
    end

    it 'プロフィールが表示されていること' do
      expect(page).to have_content user.profile
    end

    it 'アバター画像が表示されていること' do
      expect(page).to have_selector("img[src$='default_avator_image.png']")
    end

    it '投稿した場所名が表示されていること' do
      expect(page).to have_content post.location
    end

    it '投稿に対するコメント数が表示されていること' do
      expect(page).to have_content post.comments.count
    end

    it 'プロフィール編集リンクを押下するとプロフィール編集ページへ遷移すること' do
      click_on('プロフィール編集') 
      expect(current_path).to eq edit_user_path(user)
    end
  end
end
