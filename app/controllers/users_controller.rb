class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "プロフィールを更新しました。"
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:post_id)
    @comments_posts = Post.find(comments)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :avatar)
  end
end
