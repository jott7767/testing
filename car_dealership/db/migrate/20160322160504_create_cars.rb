class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :model
      t.integer :year
      t.float :price
      t.integer :mileage
      t.string :color
      t.string :interior

      t.timestamps null: false
    end
  end
end
