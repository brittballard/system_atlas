class Entity < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:it_owner_id)
  validates_presence_of(:business_owner_id)
  validates_presence_of(:entity_definition_type)
  validates_presence_of(:entity_definition_id)
  validates_presence_of(:system_identifier)
  validates_presence_of(:organization_id)
  
  validates_uniqueness_of(:name, :scope => [:organization_id])
  
  belongs_to(:organization)
  belongs_to(:entity_definition, :polymorphic => true)
  has_one(:it_owner, :class_name => :user)
  has_one(:business_owner, :class_name => :user)
end
