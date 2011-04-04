require 'spec_helper'

describe PeopleController do
  before do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create(@user)
  end
  
  describe 'create' do
    it 'should return success' do
      entity = mock_model(Entity)
      entity_definition = mock_model(Person)
      entity.stub!(:entity_definition).and_return(entity_definition)
      entity_definition.stub!(:valid?).and_return(true)
      entity.stub!(:save).and_return(true)
      Entity.stub!(:load_entity_for_save).with(an_instance_of(Person), @user).once.and_return(entity)

      post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
    end
  end
end
