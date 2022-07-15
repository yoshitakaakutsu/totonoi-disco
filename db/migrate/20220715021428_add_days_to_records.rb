class AddDaysToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :day, :datetime
  end
end
