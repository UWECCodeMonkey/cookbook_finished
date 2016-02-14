class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :get_categories, only: [:new, :edit, :update, :create]
  before_action :authenticate, except: [:index, :show]

  # GET /recipes
  # GET /recipes.json
  def index
    #@recipes = Recipe.all
    #@recipe = Recipe.includes(:category).find(params[:id])
    #@recipes = Recipe.includes(:category).all
    if params[:q]
      if params[:c].length > 0
        @category = Category.find(params[:c])
        #@recipes = Recipe.includes(:category).find_all_by_query(params[:q])
        @recipes = @category.recipes
      else
        @recipes = Recipe.find_all_by_query(params[:q])
      end
    else
      @recipes = Recipe.all
    end
    
    
    
    @title = "Listing Recipes"
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @title = "Recipe:#{@recipe.title}"
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @title = "New Recipe"
  end

  # GET /recipes/1/edit
  def edit
    @title = "Editing Recipe#{Recipe.count}"
  end

  # POST /recipes
  # POST /recipes.json
  def create
    #@title = "New Recipe"
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to edit_recipe_path(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @title = "Recipe Update"
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @title = "Recipe Destroy"
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      #@recipe = Recipe.find(params[:id])
      @recipe = Recipe.includes(:category).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, :category_id, :calories)
    end
    def get_categories
      @categories = Category.all.collect{|c| [c.name, c.id] }
    end
end


