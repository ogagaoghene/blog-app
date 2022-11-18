class Api::V1::UsersController < ApplicationController
  #   skip_before_action :verify_authenticity_token
  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def show
    @users = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @users }
    end
  end
end
