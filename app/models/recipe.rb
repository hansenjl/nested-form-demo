class Recipe < ApplicationRecord
  belongs_to :category
  has_many :measurements
  has_many :ingredients, through: :measurements
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  #accepts_nested_attributes_for :measurements, reject_if: proc { |attributes| (attributes['ingredient_id'] && attributes['ingredient_id'] == "0") || (attributes['ingredient_attributes'] && attributes['ingredient_attributes']['name'].blank?)}

  # def ingredients_attributes=(attributes)
  #    attributes.values.each do |v|
  #      self.ingredients << Ingredient.find_or_create_by(v) if !v['name'].empty?
  #    end
  # end


  def measurements_attributes=(attributes)
    attributes.values.each do |v|
      if v['ingredient_id'] && v['ingredient_id'] != "0"
        self.measurements << Measurement.create(v)
      elsif v['ingredient_attributes'] && !v['ingredient_attributes']['name'].blank?
          self.measurements << Measurement.create(v)
      end
    end
  end


end
