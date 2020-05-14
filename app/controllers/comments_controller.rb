class CommentsController < ApplicationController
  before_filter :load_discussion, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create
    @comment = @discussion.comments.new(comment_params)
    if @comment.save
      redirect_to @discussion, notice: 'Thanks for your comment'
    else
      redirect_to @discussion, alert: 'Unable to add comment'
    end
  end

  def destroy
    @discussion = current_user.discussions.find(params[:discussion_id])
    @comment = @discussion.comments.find(params[:id])
    @comment.destroy
    redirect_to @discussion, notice: 'Comment Deleted'
  end

  private
  def load_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
