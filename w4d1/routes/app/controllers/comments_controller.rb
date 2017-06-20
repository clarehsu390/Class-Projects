class CommentsController < ApplicationController

  def index
    if params[:comment][:user_id]
      @comments = User.find(:user_id).comments
    else
      @comments = Comment.all
    end
    if @comments
      render json: @comments
    else
      render json: 'noo', status: 422
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 404
    end
  end

  private
  def comment_params
    params[:comment].permit(:body, :user_id, :artwork_id)
  end

end
