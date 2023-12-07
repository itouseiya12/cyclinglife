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
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :avatar)
  end
end
