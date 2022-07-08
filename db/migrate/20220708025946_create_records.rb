class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :customer_id
      t.integer :sauna_name
      t.integer :sauna_tempureture
      t.integer :water_tempurature
      t.integer :tempreture
      t.string :wether
      t.integer :sets
      t.integer :sauna_time
      t.integer :water_time
      t.integer :totonoi_time
      t.string :sauna_type
      t.string :rouryu
      t.integer :totonoi_ratio

      t.timestamps
    end
  end
end
