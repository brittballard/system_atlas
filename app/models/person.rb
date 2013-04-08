class Person < ActiveRecord::Base
  include EntityDefinition

  belongs_to :user
  attr_readonly :email
  before_create :associate_user

  validates_presence_of(:email)

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def make_owner_of(entity_definition)
    relationship = EntityRelationship.where(parent_id: entity_definition.entity.id,
                                            child_id: self.entity.id).first

    if relationship.nil?
      relationship = EntityRelationship.new(parent_id: entity_definition.entity.id,
                                            child_id: self.entity.id,
                                            is_owner: true)
    else
      relationship.is_owner = true
    end

    relationship.save!
  end

  private

  def associate_user
    user = User.where(email: self.email).first unless self.user_id.present?
    self.user_id = user.id unless user.nil?
  end
end
