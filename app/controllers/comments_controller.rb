class CommentsController < ApplicationController
 
  before_action :require_user
  
  def create
    @goal = Goal.find(params[:goal_id])
    @comment = @goal.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", 
                  render(partial: 'comments/comment', object: @comment)
      #flash[:success] = "Your comment was added" - commented out due to actioncable addition
      #redirect_to goal_path(@goal)
    else 
      flash[:danger] = "Comment was not saved"
      redirect_to :back
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:description)
  end
  
end