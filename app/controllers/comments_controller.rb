class CommentsController < ApplicationController
  def create
    @posts = Post.find(params[:post_id])
    add_comment = current_user.comments.new(post_id: @posts.id,
                                            user_id: current_user.id, text: comment_text)
    if add_comment.save
      redirect_to "/users/#{@posts.user_id}/posts/#{@posts.id}", notice: 'Success: Comment added!'
    else
      render :new, status: 'Error: Comment not added!'
    end
  end

  def new
    @comments = Comment.new
    @posts = Post.find(params[:post_id])
  end

  private

  def comment_text
    params.require(:comments).permit(:text)[:text]
  end
end
