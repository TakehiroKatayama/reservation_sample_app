class AddCapacityToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :capacity, :integer, default: 10
  end
end
