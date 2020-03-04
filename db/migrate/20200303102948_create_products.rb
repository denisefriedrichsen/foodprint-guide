class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.date :season_start
      t.date :season_end
      t.text :content
      t.timestamps
    end
  end
end
