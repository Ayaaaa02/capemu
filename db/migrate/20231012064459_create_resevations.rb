class CreateResevations < ActiveRecord::Migration[6.1]
  def change
    create_table :resevations do |t|
      
      t.integer :cafe_id, null: false
      t.date :coming_date, null: false
      t.time :start_time, null: false
      t.integer :people, null: false
      t.integer :payment_method, null: false
     

      t.timestamps
    end
  end
end
