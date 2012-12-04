class Category < ActiveRecord::Base
  attr_accessible :name, :category_id, :product_ids
  has_and_belongs_to_many :products
end
