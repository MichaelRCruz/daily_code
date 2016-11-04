require "open-uri"
require 'coderay'
require 'json'
require 'tempfile'

class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html { @posts }
      format.json {render json: @posts }
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @snippet = open("http:" + @post.snippet.url).read
    code_string = @snippet
    @syntax_highlight = CodeRay.scan(code_string, @post.language).div(:line_numbers => :table)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user()
    # TODO: make sure user is logged in before we try to save the post

    if request.content_type == 'application/json'
      json_object = JSON.parse(request.raw_post)

      tmp = Tempfile.new('lol what is happening')
      tmp << json_object['snippet']
      tmp.flush

      @post.snippet = tmp
    end

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
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user() == @post.user
      @post.destroy
      redirect_to posts_path
    else
      flash[:notice] = "Cannot delete other user post"
    end
  end

def verified_request?
    # bypasses the csrf token check
    if request.content_type == "application/json"
      true
    else
      super()
    end
end

def download_rb
  send_file(
    "test_push.js",
    filename: "test_push.js",
    type: "application/js"
  )
end

def download_js
  send_file(
  "test.rb",
  filename: "test.json",
  type: "application/json"
  )
end

def download_json
  send_file(
  "credentials.json",
  filename: "credentials.json",
  type: "application/json"
  )
end

private
  def post_params
    params.require(:post).permit(:title, :content, :language, :user, :snippet)
  end

  def current_user
    if request.content_type == 'application/json'
      json_object = JSON.parse(request.raw_post)
      user = User.find_by(email: json_object['email'])

      @current_user ||= user.try(:authenticate, json_object['password'])
    else
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
