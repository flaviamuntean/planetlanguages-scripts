class CommentsController < ApplicationController
  before_action :set_macro, only: [:edit, :create, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.macro = @macro

    if @comment.save
      redirect_to macro_path(@macro), notice: 'New comment successfully added!'
    else
      render 'macros/new'
    end
  end

  def edit
    render 'macros/show'
  end

  def update
    if @comment.update(comment_params)
      redirect_to macro_path(@macro), notice: 'Comment successfully updated!'
    else
      render 'macros/edit'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to macro_path(@macro), notice: 'Comment successfully deleted!'
    else
      render 'macros/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :macro)
  end

  def set_macro
    @macro = Macro.find(params[:macro_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
