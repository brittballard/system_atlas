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
    can(:create, Team)
    can(:create, Person)
    can(:create, Server)
    can(:read, Entity, :organization_id => user.organization_id)
    
    set_entity_ability(:read, Application, user)
    set_entity_ability(:read, DatabaseServer, user)
    set_entity_ability(:read, ApplicationServer, user)
    set_entity_ability(:read, BusinessUnit, user)
    set_entity_ability(:read, Person, user)
    set_entity_ability(:read, Team, user)
    set_entity_ability(:read, Server, user)
  end
  
  private
  
    def define_operator(user)
      can(:manage, Organization)
      can(:manage, User)
      can(:manage, DatabaseServer)
      can(:manage, ApplicationServer)
      can(:manage, BusinessUnit)
      can(:manage, Application)
      can(:manage, Server)
    end
  
    def define_admin(user)
      can(:manage, user.organization)
      can(:manage, User, :organization_id => user.organization_id)
      can(:manage, Entity, :organization_id => user.organization_id)
      
      set_entity_ability(:manage, Application, user)
      set_entity_ability(:manage, DatabaseServer, user)
      set_entity_ability(:manage, ApplicationServer, user)
      set_entity_ability(:manage, BusinessUnit, user)
      set_entity_ability(:manage, Person, user)
      set_entity_ability(:manage, Team, user)
      set_entity_ability(:manage, Server, user)
    end
    
    def define_user(user)
      can(:manage, User, :id => user.id)
      # can(:manage, Entity, :it_owner_id => user.id)
      # 
      # can(:manage, DatabaseServer) do |database_server|
      #   database_server.entity.it_owner_id = user.id
      # end
      # 
      # can(:manage, ApplicationServer) do |application_server|
      #   application_server.entity.it_owner_id = user.id
      # end
      # 
      # can(:manage, BusinessUnit) do |business_unit|
      #   business_unit.entity.it_owner_id = user.id
      # end
    end
    
    private
      
      def set_entity_ability(ability, entity_definition, user)
        can(ability, entity_definition) do |definition|
          definition.entity.organization_id = user.organization_id
        end
      end
end