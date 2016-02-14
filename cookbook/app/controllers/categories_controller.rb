class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #before_action :get_categories, only: [:new, :edit, :update, :create]

  # GET /recipes
  # GET /recipes.json
  def index
    #@recipes = Recipe.all
    @categories = Category.all
    #@recipe = Recipe.includes(:category).find(params[:id])
    @title = "Listing Categories"
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @title = "Category:#{@category.name}"
  end

  # GET /recipes/new
  def new
    @category = Category.new
    @title = "New Category"
  end

  # GET /recipes/1/edit
  def edit
    @title = "Editing Category#{Category.count}"
  end

  # POST /recipes
  # POST /recipes.json
  def create
    #@title = "New Recipe"
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to edit_category_path(@category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @title = "Category Update"
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @title = "Category Destroy"
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @recipes = @category.recipes
      #@recipe = Recipe.includes(:category).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
    #def get_categories
    #  @categories = Category.all.collect{|c| [c.name, c.id] }
    #end
end