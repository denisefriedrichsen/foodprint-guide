class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :season_start
      t.integer :season_end
      t.text :content

      t.timestamps
    end
  end
end
