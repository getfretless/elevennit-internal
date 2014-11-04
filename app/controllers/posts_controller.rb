class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :link, :body))
    if post.save
      redirect_to posts_path, flash: { notice: 'Your post was saved successfully.' }
    else
      flash.now[:error] = post.errors.full_messages
      @post = post
      render :new
    end
  end

end
