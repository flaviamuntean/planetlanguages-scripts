class MacrosController < ApplicationController
  before_action :set_macro, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @macros = Macro.global_search(params[:query])
    else
      @macros = Macro.all
    end
  end

  def show
  end

  def new
    @macro = Macro.new
  end

  def create
    @macro = Macro.new(macro_params)

    if @macro.save
      redirect_to macro_path(@macro), notice: 'New macro successfully added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @macro = Macro.update(macro_params)
  end

  def destroy
    @macro.destroy
  end

  private

  def set_macro
    @macro = Macro.find(params[:id])
  end

  def macro_params
    params.require(:macro).permit(:name, :description, :code)
  end
end
