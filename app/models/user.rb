#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class User < ActiveRecord::Base
  USER_TYPES = ["admin", "customer"]
  
  attr_accessible :email, :password, :password_confirmation, :user_type, :name
  validates :email, presence: true, uniqueness: true
  validates :user_type, :inclusion => USER_TYPES
  has_secure_password
  has_many :orders, :dependent => :destroy

  after_destroy :ensure_an_admin_remains

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end     
end
