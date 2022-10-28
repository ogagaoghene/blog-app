class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = Post.where(user_id: params[@users.id])
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @posts = Post.new
  end

  def create
    _add_post = current_user.posts.new(add_post)
    _add_post.likes_counter = 0
    _add_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if _add_post.save
          redirect_to "/users/#{_add_post.user_id}/posts/", notice: 'Success: Post added!'
        else
          render :new, status: 'Error: Post not added!'
        end
      end
    end
  end

  private
  def add_post
    params.require(:posts).permit(:title, :text)
  end

end
