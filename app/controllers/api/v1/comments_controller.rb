class Api::V1::CommentsController < ApplicationController
  #   skip_before_action :verify_authenticity_token
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts.find(params[:post_id])
    @comments = @posts.comments
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def create
    @users = User.find(params[:user_id])
    @posts = @users.posts.find(params[:post_id])
    @comments = @posts.comments.create(text: comment_parameters[:text], author_id: @users.id, post_id: @posts.id)

    if @comments.save
      respond_to do |format|
        format.html { redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully' }

        format.json { render json: @comments, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
