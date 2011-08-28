class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to :back
    else
      flash[:error] = "Comment could not be created"
      redirect_to :back
    end
  end
end
