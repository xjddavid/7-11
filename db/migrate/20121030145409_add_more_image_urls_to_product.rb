class AddMoreImageUrlsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image_url2, :string
    add_column :products, :image_url3, :string
    add_column :products, :image_url4, :string
    add_column :products, :image_url5, :string
    add_column :products, :image_url6, :string
  end
end
