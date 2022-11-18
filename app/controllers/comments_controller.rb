class CommentsController < ApplicationController
  def new
    @posts = Post.find(params[:post_id])
    @comments = @posts.Comment.new
  end

  def create
    @posts = Post.find(params[:post_id])
    add_comment = current_login.comments.new(post_id: @posts.id,
                                             user_id: current_login.id, text: comment_text)
    if add_comment.save
      redirect_to user_posts_path(current_login), notice: 'Success: Comment added!'
    else
      render :new, status: 'Error: Comment not added!'
    end
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to user_post_path(current_login.id, @comments.post_id),
                notice: "Successfully deleted the comment #{@comments.text}."
  end

  private

  def comment_text
    params.require(:comments).permit(:text)[:text]
  end
end
