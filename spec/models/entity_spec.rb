require 'spec_helper'

describe Entity do  
  describe 'validations and relationshipes' do
    before(:all) do
      @organization = Factory.create(:entity)
    end
    
    it { should validate_presence_of(:entity_definition_type) }
    it { should validate_presence_of(:entity_definition_id) }
    it { should validate_presence_of(:system_identifier) }
    it { should validate_presence_of(:organization_id) }
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