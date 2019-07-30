class Recipe < ApplicationRecord
  belongs_to :category
  has_many :measurements
  has_many :ingredients, through: :measurements
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  #accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }

 validates :name, presence: true
  accepts_nested_attributes_for :measurements, reject_if: proc {|measurement_params| measurement_params.values.any?(&:empty?) ||
   (measurement_params["ingredient_attributes"]["name"].blank? && !measurement_params["ingredient_id"])}

  # def ingredients_attributes=(attributes)
  #    attributes.values.each do |v|
  #      self.ingredients << Ingredient.find_or_create_by(v) if !v['name'].empty?
  #    end
  # end




  # def measurements_attributes=(attributes)
  #   attributes.values.each do |measurement_params|
  #     if !measurement_params.values.any?(&:empty?) && (!measurement_params["ingredient_attributes"]["name"].blank? || measurement_params["ingredient_id"])
  #         self.measurements << Measurement.create(measurement_params)
  #     end
  #   end
  # end


# !measurement_params.values.any?(&:empty?)
# !measurement_params.values.any?{|x|x.empty?}

end
