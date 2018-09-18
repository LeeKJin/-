class CreateQuestionIds < ActiveRecord::Migration
  def change
    create_table :question_ids do |t|
      
      t.integer :age
      t.integer :user_id
      t.string :gender
      t.string :drink_frequency
      t.string :smoke
      t.string :sleep_time
      
      t.integer :shape
      t.string :color
      t.string :smell
      t.string :blood
      
      t.timestamps null: false
    end
  end
end
