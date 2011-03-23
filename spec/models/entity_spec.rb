require 'spec_helper'

describe Entity do  
  it 'should respond to system_identifier, organization, entity_definition' do
    Entity.new.should respond_to(:system_identifier, :organization, :entity_definition)
  end
  
  describe 'parent child relationships between entities' do
    before do
      @entity = Factory.create(:entity)
    end
    
    it 'should allow entities to have child entities' do
      @entity.save
      @entity.children.length.should == 0

      @entity.children << Factory.create(:entity)
      @entity.children.length.should == 1
      
      @entity.children << Factory.create(:entity)
      @entity.children.length.should == 2
    end
  end
end