class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post

    authorize @comment
    if @comment.save
     flash[:notice] = "Comment was posted."
     redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error posting the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments
    @comment = @post.comments.find(params[:id])
    @comment.post = @post

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end

  end
end


