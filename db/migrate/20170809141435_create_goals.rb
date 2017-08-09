class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      
      t.string :name
      t.string :category
      t.text :description
      t.timestamps
    end
  end
end
