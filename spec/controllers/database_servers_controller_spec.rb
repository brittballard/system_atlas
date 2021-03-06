require 'spec_helper'

describe DatabaseServersController do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  # Because this method calls a method in it's parent class I'm only testing a simple happy path for this class. To view more indepth testing of the method in the EntityDefinitionController see the people controller spec.
  describe 'create' do
    before do
      @entity = mock_model(Entity)
      @entity_definition = mock_model(DatabaseServer)
      @entity.stub!(:entity_definition).and_return(@entity_definition)
      Entity.stub!(:load_entity_for_save).with(an_instance_of(DatabaseServer), @user).once.and_return(@entity)
      @entity_definition.stub!(:valid?).and_return(true)
      @entity.stub!(:save).and_return(true)
      post :create, { :database_server => FactoryGirl.attributes_for(:database_server).merge({ :entity_attributes => { :system_identifier => '' } }) }
    end

    it 'should return success' do
      response.should be_success
    end
    
    it 'should set the flash' do
      flash[:notice].should == 'Database Server created successfully.'
    end
    
    it 'should render index' do
      response.should render_template(:index)
    end
  end
end
