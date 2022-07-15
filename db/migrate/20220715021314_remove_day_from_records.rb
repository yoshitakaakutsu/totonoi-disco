class RemoveDayFromRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :day, :date
  end
end
