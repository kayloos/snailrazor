class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @title = "Posts"

    @posts = Post.all
  end

  def show
    redirect_to(edit_post_path(params[:id])) if user_signed_in?

    @title = "Show post"
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def preview
    @text = params["text"]
    render :layout => false
  end

  def new
    @title = "Add post"

    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])

    if @post.save
      flash[:success] = "Post saved!"
      redirect_to posts_path
    else
      flash[:error] = "Post could not be saved."
      render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])
    render "new"
  end

  def update
    @post = Post.find(params[:id]) 
    @post.update_attributes(params[:post])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post has been destroyed"
    else
      flash[:error] = "Unable to destroy post"
    end
    redirect_to posts_path
  end
end
