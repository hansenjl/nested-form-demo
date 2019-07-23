class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.build_category
    3.times {@recipe.ingredients.build}
  end

  def create

    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if !@recipe
  end

  def edit
  end

   def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :category_id, ingredient_ids:[], category_attributes:[:name], ingredients_attributes: [:name])
  end





  def set_recipe
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if !@recipe
  end
end
