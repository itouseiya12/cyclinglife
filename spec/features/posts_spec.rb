require 'rails_helper'

RSpec.describe "Posts", type: :feature do
  let!(:user){ create(:user) }
  let!(:post){ create(:post, user: user) }
  let!(:comment){ create(:comment, user: user, post: post)}

  describe '投稿一覧ページ' do
    before do
      visit new_user_session_path
      fill_in "Eメール", with: user.email
      fill_in "パスワード", with: user.password
      click_on('ログイン') 
      visit posts_path
    end

    it '投稿者名が表示されていること' do
      expect(page).to have_content post.user.name
    end

    it '投稿場所名が表示されていること' do
      expect(page).to have_content post.location
    end

    it 'コメント件数が表示されていること' do
      expect(page).to have_content post.comments.count
    end
    
    it 'いいね件数が表示されていること' do
      expect(page).to have_content post.favorited_users.count
    end

    it '投稿リンクを押下すると投稿詳細ページへ遷移すること' do
      click_on post.location
      expect(current_path).to eq post_path(post)
    end
  end

  describe "投稿詳細ページ" do
    before do
      visit new_user_session_path
      fill_in "Eメール", with: user.email
      fill_in "パスワード", with: user.password
      click_on('ログイン') 
      visit post_path(post)
    end
    
    it '投稿した画像が表示されていること' do
      expect(page).to have_selector("img[src$='Tokyo_image.png']")
    end
  
    it '投稿場所名が表示されていること' do
      expect(page).to have_content post.location
    end

    it '投稿者名が表示されていること' do
      expect(page).to have_content post.user.name
    end

    it '感想が表示されていること' do
      expect(page).to have_content post.text 
    end

    it '投稿の編集ボタンが表示されていること' do
      expect(page).to have_content "編集"
    end

    it '投稿の削除ボタンが表示されていること' do
      expect(page).to have_content "削除"
    end

    it 'コメントしたユーザー名が表示されていること' do
      expect(page).to have_content comment.user.name
    end
  
    it 'コメント投稿日が表示されていること' do
      expect(page).to have_content comment.created_at.strftime('%Y/%m/%d')
    end

    it 'コメント内容が表示されていること' do
      expect(page).to have_content comment.comment
    end

    it 'コメントの送信ボタンが表示されていること' do
      expect(page).to have_button "送信する"
    end
  
    it '投稿一覧リンクを押下すると投稿一覧ページへ遷移すること' do
      click_on "投稿一覧ページへ"
      expect(current_path).to eq posts_path
    end
  end
end
