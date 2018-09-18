class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      
      t.string :hospital_name
      t.string :address
      t.string :hospital_number
      t.string :hospital_infom

      t.timestamps null: false
    end
  end
end
