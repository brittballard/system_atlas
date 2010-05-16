class Organization < ActiveRecord::Base
  has_many :users
  validates_presence_of :name
  validates_presence_of :address_line_one
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code
end
