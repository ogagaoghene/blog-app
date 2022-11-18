class Api::V1::PostsController < ApplicationController
  #   skip_before_action :verify_authenticity_token
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def show
    @users = User.find(params[:user_id])
    @posts = @users.posts.find(params[:id])
    respond_to do |format|
      format.json { render json: @posts }
    end
  end
end
