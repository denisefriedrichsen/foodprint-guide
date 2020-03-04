class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.date :season_start
      t.date :season_end
      t.text :content
      t.string :fact1
      t.string :fact2
      t.string :fact3
      t.timestamps
    end
  end
end
