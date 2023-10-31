class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new 
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     redirect_to post_path(@post.id)
    else
     render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:location, :text)
  end
end
