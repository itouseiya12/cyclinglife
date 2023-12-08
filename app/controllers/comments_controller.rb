class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = post.id
    if @comment.save
      redirect_to post_path(post), notice: "コメントを投稿しました。"
    else
      flash.now[:alert] = "コメントに失敗しました" 
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render 'posts/show', status: :unprocessable_entity
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id]), notice: "コメントを削除しました。"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
