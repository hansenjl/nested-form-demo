class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
    redirect_to ingredients_path if !@ingredient
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
