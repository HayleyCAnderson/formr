class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :user_id, index: true
      t.string :name

      t.timestamps
    end
  end
end
