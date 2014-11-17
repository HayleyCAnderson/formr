class ChangeUserIdInSurveys < ActiveRecord::Migration
  def change
    rename_column :surveys, :user_id_id, :user_id
  end
end
