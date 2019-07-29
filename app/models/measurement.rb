class Measurement < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  accepts_nested_attributes_for :ingredient

  def ingredient_attributes=(attributes)
    binding.pry
    self.ingredient = Ingredient.find_or_create_by(attributes)
  end
end
