class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :organization_id
  belongs_to :organization
  after_create :create_person
  before_create :set_role
  
  validates_presence_of :organization_id
  validate :valid_organization_id
  
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
  
  private
    
    def set_role
      self.roles = ['user'] unless self.roles.present?
    end
  
    def create_person
      person = Person.new({ :email => self.email, :organization_id => self.organization_id, :user_id => self.id })
      person.save
    end
  
    def valid_organization_id
      errors.add(:organization_id, "Invalid organization.") unless Organization.where(:id => self.organization_id).count > 0
    end
  
end
