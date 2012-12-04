class AddQuantityToCartToProduct < ActiveRecord::Migration
  def change
    add_column :products, :quantity_to_cart, :integer, default: 1
  end
end
