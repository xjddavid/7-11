class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :number
end
