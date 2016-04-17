class CommentsController < ApplicationController
before_filter :authorized?, only: [:destroy]
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.where(id: params[:post_id]).last
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments.all.order('created_at DESC')
    @comment.save
    respond_to do |format|
      format.html {
        flash[:notice] = 'Comment added.'
        redirect_to :back
      }
      format.js
    end
  end

  def destroy
    @comment = Comment.where(id: params[:id]).last
    @comment.delete
    redirect_to :back
  end

  private

  def authorized?
    unless logged_in?
      redirect_to root_path
      flash[:danger] = 'You are not an administrator.'
    end
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
