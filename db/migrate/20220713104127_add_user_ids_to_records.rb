class AddUserIdsToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :user_id, :integer
  end
end
