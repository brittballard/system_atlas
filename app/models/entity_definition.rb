module EntityDefinition
  module ClassMethods
    def act_as_entity_definition
      validates_presence_of(:organization_id)

      has_one :entity, :as => :entity_definition
      belongs_to :organization

      accepts_nested_attributes_for :entity

      scope :entity_definitions_for_user, lambda { |user|
                                            joins("INNER JOIN entities e ON e.entity_definition_id = #{self.quoted_table_name}.id")
                                            .joins("INNER JOIN entity_relationships er ON er.parent_id = e.id")
                                            .joins("INNER JOIN entities e2 on e2.id = er.child_id")
                                            .joins("INNER JOIN people p on p.id = e2.entity_definition_id AND e2.entity_definition_type = '#{Person.to_s}'")
                                            .where("p.user_id = ? AND er.is_owner = 1", user.id) }
    end
  end

  def children
    self.entity.children unless self.entity.nil?
  end

  def self.included(host_class)
    host_class.extend(ClassMethods)
    host_class.act_as_entity_definition
  end
end
