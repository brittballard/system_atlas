require 'spec_helper'

describe Entity do
  before do
    @entity = FactoryGirl.create(:entity)
  end
  
  it 'should respond to system_identifier, organization, entity_definition' do
    Entity.new.should respond_to(:system_identifier, :organization, :entity_definition)
  end
  
  it 'should destroy all entity relationship when the entity is destroyed' do
    entity_to_destroy = FactoryGirl.create(:entity)
    entity_to_destroy.entity_relationships << EntityRelationship.new({ :parent_id => @entity.id })
    EntityRelationship.count.should == 1

    entity_to_destroy.destroy
    EntityRelationship.count.should == 0
  end
  
  describe 'parent child relationships between entities' do    
    it 'should allow entities to have child entities' do
      @entity.save
      @entity.children.length.should == 0

      @entity.children << FactoryGirl.create(:entity)
      @entity.children.length.should == 1
      
      @entity.children << FactoryGirl.create(:entity)
      @entity.children.length.should == 2
    end
  end
  
  describe 'owners' do
    it 'should return all people children with the is_owner flag set' do      
      britton = FactoryGirl.create(:person, :first_name => 'britton')
      server = FactoryGirl.create(:server)
      britton.make_owner_of(server)
      
      server.entity.owners.count.should == 1
    end
  end
  
  describe 'load_entity_for_save' do
    it 'should get an entity prepared to be saved, but to be honest at the moment i don\'t remember why it\'s doing some of the stuff it\'s doing' do
      person = FactoryGirl.build(:person)
      person.stub!(:save)
      current_user = FactoryGirl.build(:user)
      entity = Entity.load_entity_for_save(person, current_user)
      entity.entity_definition.should == person
      entity.organization.should == current_user.organization
      entity.system_identifier.should == "O#{Date.today.to_formatted_s(:number)}#{Entity.last.id + 1}"
    end
  end
end