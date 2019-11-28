class CommentsController < ApplicationController
  before_action :set_macro, only: [:edit, :create, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @macros = Macro.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.macro = @macro

    if @comment.save
      respond_to do |format|
        format.html { redirect_to macro_path(@macro), notice: 'New comment added.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'macros/show' }
        format.js # <-- idem
      end
    end
  end

  def edit
    render 'macros/show'
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to macro_path(@macro), notice: 'Comment successfully updated!' }
        format.js # <-- idem
      end
    else
      respond_to do |format|
        format.html { render 'macros/edit' }
        format.js # <-- idem
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to macro_path(@macro), notice: 'Comment successfully deleted!' }
        format.js # <-- idem
      end
    else
      respond_to do |format|
        format.html { render 'macros/show' }
        format.js # <-- idem
      end
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
