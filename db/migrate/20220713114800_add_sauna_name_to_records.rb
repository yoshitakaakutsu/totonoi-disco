class AddSaunaNameToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :sauna_name, :string
  end
end
