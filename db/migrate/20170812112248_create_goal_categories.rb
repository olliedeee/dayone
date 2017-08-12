class CreateGoalCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_categories do |t|
      t.integer :goal_id
      t.integer :category_id
    end
  end
end
