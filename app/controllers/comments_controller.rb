class CommentsController < ApplicationController
  before_action :set_macro, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.macro = @macro

    if @comment.save
      redirect_to macro_path(@macro), notice: 'New comment successfully added!'
    # else
    #   render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :macro)
  end

  def set_macro
    @macro = Macro.find(params[:macro_id])
  end
end
