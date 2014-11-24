class AddRecommendedToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :recommended, :boolean, null: false, default: false
  end
end
