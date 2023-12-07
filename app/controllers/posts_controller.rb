class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new 
    @comments = @post.comments
    @favorite = Favorite.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     redirect_to post_path(@post.id), notice: "投稿が完了しました。"
    else
      flash.now[:alert] = "投稿に失敗しました" 
     render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "投稿内容を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "投稿を削除しました。"
  end
  
  private
  def post_params
    params.require(:post).permit(:location, :text, :postimage, :address, :latitude, :longitude)
  end
end
