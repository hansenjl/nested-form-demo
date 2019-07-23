class Category < ApplicationRecord
    has_many :recipes
    validates :name, uniqueness: true, presence: true
end
