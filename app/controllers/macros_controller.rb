class MacrosController < ApplicationController
  before_action :set_macro, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]

  def index
    if params[:query].present?
      @macros = Macro.global_search(params[:query]).order('name ASC')
    elsif params[:tags].present?
      @macros = Macro.tagged_with(params[:tags]).order('name ASC')
    else
      @macros = Macro.all.order('name ASC')
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @macro = Macro.new
  end

  def create
    @macro = Macro.new(macro_params)
    @macro.photo = Unsplash::Photo.search("Coding").sample.urls.regular

    if @macro.save
      redirect_to macro_path(@macro), notice: 'New macro successfully added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @macro.photo.nil?
      @macro.photo = Unsplash::Photo.search("Coding").sample.urls.regular
    end

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

  # favorite methods

  def favorite
    if current_user.favorite(@macro)
      respond_to do |format|
        flash.now[:notice] = "Added to favourites."
        format.html { redirect_back(fallback_location: macro_path(@macro), notice: "Added to favourites.") }
        format.js
      end
    else
      render :show
    end
  end

  def unfavorite
    if current_user.unfavorite(@macro)
      respond_to do |format|
        flash.now[:notice] = "Removed from favourites."
        format.html { redirect_back(fallback_location: macro_path(@macro), notice: "Removed from favourites.") }
        format.js
      end
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
