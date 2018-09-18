class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      
      t.integer :user_id
      t.integer :history_q_ID
      t.integer :history_q_result
      t.text :h_result

      t.timestamps null: false
    end
  end
end
