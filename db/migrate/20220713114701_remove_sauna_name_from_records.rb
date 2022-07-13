class RemoveSaunaNameFromRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :sauna_name, :integer
  end
end
