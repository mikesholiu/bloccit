class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post

    authorize @comment
    if @comment.save
     flash[:notice] = "Comment was posted."
     redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error posting the comment. Please try again."
      render 'posts/show'
    end
  end
end


