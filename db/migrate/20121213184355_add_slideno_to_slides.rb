class AddSlidenoToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :slideno, :integer, :default => 0
  end
end
