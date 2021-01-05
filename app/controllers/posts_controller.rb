class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to root_path
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end
end
