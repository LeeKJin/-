class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      
      t.integer :question_id
      t.text :shape
      t.string :color

      t.timestamps null: false
    end
  end
end
