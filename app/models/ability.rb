class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    
    if user.is?(:operator)
      define_operator(user)
    elsif user.is?(:admin)
      define_admin(user)
    elsif user.is?(:user)
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
    can(:read, Application, :organization_id => user.organization_id)
    can(:read, DatabaseServer, :organization_id => user.organization_id)
    can(:read, ApplicationServer, :organization_id => user.organization_id)
    can(:read, BusinessUnit, :organization_id => user.organization_id)
    can(:read, Person, :organization_id => user.organization_id)
    can(:read, Team, :organization_id => user.organization_id)
    can(:read, Server, :organization_id => user.organization_id)
  end
  
  private
  
    def define_operator(user)
      can(:manage, Organization)
      can(:manage, User)
      can(:manage, DatabaseServer)
      can(:manage, ApplicationServer)
      can(:manage, BusinessUnit)
      can(:manage, Application)
      can(:manage, Person)
      can(:manage, Team)
      can(:manage, Server)
    end
  
    def define_admin(user)
      can(:manage, user.organization)
      can(:manage, User, :organization_id => user.organization_id)
      can(:manage, Entity, :organization_id => user.organization_id)
      can(:manage, Application, :organization_id => user.organization_id)
      can(:manage, DatabaseServer, :organization_id => user.organization_id)
      can(:manage, ApplicationServer, :organization_id => user.organization_id)
      can(:manage, BusinessUnit, :organization_id => user.organization_id)
      can(:manage, Person, :organization_id => user.organization_id)
      can(:manage, Team, :organization_id => user.organization_id)
      can(:manage, Server, :organization_id => user.organization_id)
    end
    
    def define_user(user)
      can(:manage, User, :id => user.id)
      can(:manage, Person, :user_id => user.id)
      can([:update, :destroy], Entity, Entity.current_users_entities(user)) do |entity|
        entity.children.where(:entity_definition_type => Person.to_s).people.where("p.user_id = #{user.id}")
      end
      
      actions = [:edit, :update, :destroy]
      
      set_user_ability(actions, Application, user)
      set_user_ability(actions, DatabaseServer, user)
      set_user_ability(actions, ApplicationServer, user)
      set_user_ability(actions, BusinessUnit, user)
      set_user_ability(actions, Team, user)
      set_user_ability(actions, Server, user)
    end

    def set_user_ability(actions, type, user)
      can(actions, type, type.entity_definitions_for_user(user)) do |object|
        is_owner(object, user)
      end
    end
    
    def is_owner(object, user)
      object.entity.children.where(:entity_definition_type => Person.to_s).people.count > 0
    end
end