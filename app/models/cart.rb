#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.build(product_id: product[:id])
    current_item.price = current_item.product.price
    current_item.quantity = product[:quantity]
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
