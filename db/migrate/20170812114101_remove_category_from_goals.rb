class RemoveCategoryFromGoals < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :category
  end
end
