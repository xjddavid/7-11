class Slide < ActiveRecord::Base
  attr_accessible :description, :image_url, :title, :url, :slideno
  validates :title, presence: true
  validates :image_url, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :slideno, presence: true
end
