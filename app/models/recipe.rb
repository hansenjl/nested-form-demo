class Recipe < ApplicationRecord
  belongs_to :category
  has_many :measurements
  has_many :ingredients, through: :measurements
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  #accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }

  def ingredients_attributes=(attributes)
     attributes.values.each do |v|
       self.ingredients << Ingredient.find_or_create_by(v) if !v['name'].empty?
     end
  end


end
