class Measurement < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  def ingredient_attributes=(ingredient_params)
    if !ingredient_params['name'].empty?
      self.ingredient = Ingredient.find_or_create_by(ingredient_params)
    end
  end
end
