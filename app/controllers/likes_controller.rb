class LikesController < ApplicationController
  def create
    @posts = Post.find(params[:post_id])
    _add_like = current_user.likes.new(user_id: current_user.id, post_id: @post.id)
    if _add_like.save
      redirect_to "/users/#{@posts.user_id}/posts/#{@posts.id}", notice: 'Success: Like added!'
    else
      redirect_to "/users/#{@posts.user_id}/posts/#{@posts.id}", notice: 'Error: Like not added!'
    end
  end
end
