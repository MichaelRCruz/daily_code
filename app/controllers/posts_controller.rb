require "open-uri"
class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @snippet = open("http:" + @post.snippet.url).read
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user()
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
    else
      render :edit
    end
  end

  def destroy
    if User.find_by(id: session[:user_id]) == Post.find_by(id: session[:user_id])
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    else
      flash[:notice] = "Cannot delete other user post"
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :language, :user, :snippet)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
