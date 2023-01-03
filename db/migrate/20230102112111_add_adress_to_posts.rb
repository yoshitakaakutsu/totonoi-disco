class AddAdressToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :adress, :string
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
