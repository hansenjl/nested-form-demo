class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.belongs_to :category, foreign_key: true
      t.string :instructions

      t.timestamps
    end
  end
end
