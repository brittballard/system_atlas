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
    
  end
  
  private
  
    def define_admin(user)
      can(:manage, User, :organization_id => user.organization_id)
      
      can(:manage, Organization) do |action, organization|
        user.organization == organization
      end
    end
    
    def define_user(user)
      can(:manage, User) do |action, authorize_user|
        debugger
        user == authorize_user
      end
    end
    
end