class Person < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
  has_one :organization, :through => :entity
  belongs_to :user
  attr_readonly :email
  
  accepts_nested_attributes_for :entity
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
