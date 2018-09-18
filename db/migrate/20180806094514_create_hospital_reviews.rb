class CreateHospitalReviews < ActiveRecord::Migration
  def change
    create_table :hospital_reviews do |t|
      
      t.integer :review_userID
      t.string :review_content

      t.timestamps null: false
    end
  end
end
