class CommentsController < ApplicationController
  # def create
  #   @posts = Post.find(params[:post_id])
  #   add_comment = current_login.comments.new(post_id: @posts.id,
  #                                           user_id: current_login.id, text: comment_text)
  #   if add_comment.save
  #     redirect_to "/users/#{@posts.user_id}/posts/#{@posts.id}", notice: 'Success: Comment added!'
  #   else
  #     render :new, status: 'Error: Comment not added!'
  #   end
  # end


  def create
    @posts = Post.find(params[:post_id])
    @comments = @post.comments.create(text: comment_parameters[:text], user_id: current_login.id, post_id: @posts.id)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(@posts.user.id, @posts.id), notice: 'Comment created successfully'
        else
          redirect_to user_post_path(@posts.user.id, @post.id), alert: 'An error occured, please try again!'
        end
      end
    end
  end


  def new
    @comments = Comment.new
    @posts = Post.find(params[:post_id])
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to user_post_path(current_login, @comments.post_id),
                notice: "Successfully deleted the comment #{@comments.text}."
  end

  private

  def comment_text
    params.require(:comments).permit(:text)[:text]
  end
end
