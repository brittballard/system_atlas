class User < ActiveRecord::Base
  belongs_to :organization
  
  acts_as_authentic
  
  ROLES = %w[admin user]
  
  def roles=(roles)
    self.roles_mask = (roles & User::ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
end
