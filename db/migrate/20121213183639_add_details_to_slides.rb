class AddDetailsToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :title, :string
    add_column :slides, :image_url, :string
    add_column :slides, :url, :string
    add_column :slides, :description, :string
  end
end
