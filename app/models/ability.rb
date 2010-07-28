class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    
    if user.is?(:admin)
      define_admin(user)
    end
    
    if user.is?(:user)
      define_user(user)
    end
    
    can(:create, User)
    can(:create, Organization)
    can(:create, Entity)
    can(:create, DatabaseServer)
    can(:create, ApplicationServer)
    can(:create, BusinessUnit)
    
  end
  
  private
  
    def define_admin(user)
      can(:manage, User, :organization_id => user.organization_id)
      can(:manage, Organization, :id => user.organization_id)
    end
    
    def define_user(user)
      can(:manage, User, :id => user.id)
      can(:manage, Entity, :it_owner_id => user.id)
    end
end