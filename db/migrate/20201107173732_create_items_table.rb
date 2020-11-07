
class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |x|
      x.string :name
      x.string :price
      x.string :description 
    end
  end
end

