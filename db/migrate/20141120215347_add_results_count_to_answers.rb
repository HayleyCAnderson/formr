class AddResultsCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :results_count, :integer, default: 0, null: false
  end
end
