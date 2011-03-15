class User < ActiveRecord::Base
  belongs_to :organization
  after_save :create_person
  merge_validates_length_of_login_field_options :message => 'is too short. Minimum 3 characters required'
  
  acts_as_authentic
  
  ROLES = %w[admin user operator]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
  def create_person
    person = Person.new({ :email => self.email })
    person.save
  end
  
end
