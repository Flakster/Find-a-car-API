class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :color
      t.integer :year
      t.integer :price

      t.timestamps
    end
  end
end
