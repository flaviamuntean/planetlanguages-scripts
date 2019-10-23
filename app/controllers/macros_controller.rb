class MacrosController < ApplicationController
  before_action :set_macro, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @macros = Macro.global_search(params[:query])
    elsif params[:tags].present?
      @macros = Macro.tagged_with(params[:tags])
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
    if @macro.update(macro_params)
      redirect_to macro_path(@macro), notice: 'Macro successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    if @macro.destroy
      redirect_to macros_path, notice: 'Macro successfully deleted!'
    else
      render :show
    end
  end

  private

  def set_macro
    @macro = Macro.find(params[:id])
  end

  def macro_params
    params.require(:macro).permit(:name, :description, :code, tag_list: [])
  end
end
