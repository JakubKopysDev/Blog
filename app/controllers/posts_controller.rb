class PostsController < ApplicationController
before_action :find_post, only: [:show, :destroy, :edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
      flash[:success] = 'Post created.'
    else
      flash[:danger] = 'Post invalid.'
      render 'new'
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.delete
    redirect_to posts_path
    flash[:notice] = 'Post deleted.'
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post
      flash[:success] = 'Post updated.'
    else
      render 'edit'
    end
  end

  private 
  
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.where(id: params[:id]).last
  end
end
