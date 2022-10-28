class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(post_id: @post.id,
                                            user_id: current_user.id, text: comment_text)
    if new_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success Comment Saved!'
    else
      render :new, status: 'Error occured with Comment!'
    end
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  private
  def comment_text
    params.require(:comments).permit(:text)[:text]
  end
end
