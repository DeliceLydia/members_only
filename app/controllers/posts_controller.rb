class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to 
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
