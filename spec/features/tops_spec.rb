require 'rails_helper'

RSpec.describe "Top page", type: :feature do
  let!(:user){ create(:user) }
  
  describe 'ヘッダー' do
    context 'ログアウトしている場合' do
      before do
        visit root_path
      end

      it 'Top pageのリンクが表示されること' do
        expect(page).to have_content "Top page"
      end

      it 'Sign upのリンクが表示されること' do
        expect(page).to have_content "Sign up"
      end

      it 'Log inのリンクが表示されること' do
        expect(page).to have_content "Log in"
      end

      it 'Guest Log inのリンクが表示されること' do
        expect(page).to have_content "Guest Log in"
      end

      it 'Top pageのリンクを押下するとトップページへ遷移すること' do
        click_on "Top page"
        expect(current_path).to eq root_path
      end

      it 'Sign upのリンクを押下すると新規登録ページへ遷移すること' do
        click_on "Sign up"
        expect(current_path).to eq new_user_registration_path
      end

      it 'Log inのリンクを押下するとログインページへ遷移すること' do
        click_on "Log in"
        expect(current_path).to eq new_user_session_path
      end

      it 'Guest Log inのリンクを押下するとゲストユーザーでログインできること' do
        click_on "Guest Log in"
        expect(current_path).to eq root_path
      end
    end

    context 'ログインしている場合' do
      before do
        visit new_user_session_path
        fill_in "Eメール", with: user.email
        fill_in "パスワード", with: user.password
        click_on('ログイン')  
      end
        
      it 'My pageのリンクが表示されること' do
        expect(page).to have_content "My page"
      end
      
      it 'Postへのリンクが表示されること' do
        expect(page).to have_content "Post"
      end

      it 'Posts Listのリンクが表示されること' do
        expect(page).to have_content "Posts List"
      end

      it 'My pageのリンクが表示されること' do
        expect(page).to have_content "My page"
      end

      it 'Log outのリンクが表示されること' do
        expect(page).to have_content "Log out"
      end

      it 'My pageのリンクを押下するとMy pageへ遷移すること' do
        click_on "My page"
        expect(current_path).to eq user_path(user)
      end

      it 'Postのリンクを押下するとPostへ遷移すること' do
        click_on "Post"
        expect(current_path).to eq new_post_path
      end

      it 'Posts Listのリンクを押下するとPosts Listへ遷移すること' do
        click_on "Posts List"
        expect(current_path).to eq posts_path
      end

      it 'User Listのリンクを押下するとUser Listへ遷移すること' do
        click_on "User List"
        expect(current_path).to eq users_path
      end

      it 'Log outのリンクを押下するとログアウト状態になること' do
        click_on "Log out"
        expect(current_path).to eq root_path
      end
    end
  end
end
