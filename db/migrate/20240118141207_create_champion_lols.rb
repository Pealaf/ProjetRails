class CreateChampionLols < ActiveRecord::Migration[7.1]
  def change
    create_table :champion_lols do |t|
      t.string :name
      t.string :role
      t.integer :difficulty
      t.integer :price

      t.timestamps
    end
  end
end
