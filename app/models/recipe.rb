class Recipe < ApplicationRecord
  belongs_to :category
  has_many :measurements
  has_many :ingredients, through: :measurements
end
