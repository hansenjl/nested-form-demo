class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.belongs_to :recipe, foreign_key: true
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
