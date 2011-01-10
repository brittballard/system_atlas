class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    
    if user.is?(:operator)
      define_operator(user)
    end
    
    if user.is?(:admin)
      define_admin(user)
    end
    
    if user.is?(:user)
      define_user(user)
    end
    
    can(:create, User)
    can(:create, Entity)
    can(:create, DatabaseServer)
    can(:create, ApplicationServer)
    can(:create, BusinessUnit)
    
    can(:read, Entity, :organization_id => user.organization_id)
    
    can(:read, DatabaseServer) do |database_server|
      database_server.entity.organization_id = user.organization_id
    end
    
    can(:read, ApplicationServer) do |application_server|
      application_server.entity.organization_id = user.organization_id
    end
    
    can(:read, BusinessUnit) do |business_unit|
      business_unit.entity.organization_id = user.organization_id
    end

  end
  
  private
  
    def define_operator(user)
      can(:manage, Organization)
      can(:manage, User)
      can(:manage, DatabaseServer)
      can(:manage, ApplicationServer)
      can(:manage, BusinessUnit)
    end
  
    def define_admin(user)
      can(:manage, User, :organization_id => user.organization_id)
      can(:manage, Entity, :organization_id => user.organization_id)
      can(:manage, user.organization)
      
      can(:manage, DatabaseServer) do |database_server|
        database_server.entity.organization_id = user.organization_id
      end

      can(:manage, ApplicationServer) do |application_server|
        application_server.entity.organization_id = user.organization_id
      end

      can(:manage, BusinessUnit) do |business_unit|
        business_unit.entity.organization_id = user.organization_id
      end
    end
    
    def define_user(user)
      can(:manage, User, :id => user.id)
      can(:manage, Entity, :it_owner_id => user.id)
      
      can(:manage, DatabaseServer) do |database_server|
        database_server.entity.it_owner_id = user.id
      end
      
      can(:manage, ApplicationServer) do |application_server|
        application_server.entity.it_owner_id = user.id
      end
      
      can(:manage, BusinessUnit) do |business_unit|
        business_unit.entity.it_owner_id = user.id
      end
    end
end