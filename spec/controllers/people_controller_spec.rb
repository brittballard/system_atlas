require 'spec_helper'

describe PeopleController do
  before do
    @user = Factory(:user)
    sign_in @user
  end
  
  describe 'create' do
    before do
      @entity = mock_model(Entity)
      @entity_definition = mock_model(Person)
      @entity.stub!(:entity_definition).and_return(@entity_definition)
      Entity.stub!(:load_entity_for_save).with(an_instance_of(Person), @user).once.and_return(@entity)
    end
    
    describe 'success' do
      before do
        @entity_definition.stub!(:valid?).and_return(true)
        @entity.stub!(:save).and_return(true)
        post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
      end

      it 'should return success' do
        response.should be_success
      end
      
      it 'should set the flash' do
        flash[:notice].should == 'Person created succesfully.'
      end
      
      it 'should render index' do
        response.should render_template(:index)
      end
    end
    
    describe 'failure' do
      before do
        @entity_definition_errors = mock(:errors)
        @entity_definition_errors.stub!(:full_messages).and_return(['britton'])
        @entity_errors = mock(:errors)
        @entity_errors.stub!(:full_messages).and_return([])
        @entity_definition.stub!(:errors).and_return(@entity_definition_errors)
        @entity.stub!(:errors).and_return(@entity_errors)
        @entity_definition.stub!(:valid?).and_return(false)
        @entity.stub!(:save).and_return(true)
      end
      
      it 'should fail when person is not valid' do
        post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }        
        flash[:error].should == "Error: britton"
      end
      
      it 'should fail when the entity is not valid' do
        @entity_definition_errors.stub!(:full_messages).and_return([])
        @entity_errors.stub!(:full_messages).and_return(['britton'])
        @entity_definition.stub!(:valid?).and_return(true)
        @entity.stub!(:save).and_return(false)

        post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
        flash[:error].should == "Error: britton"
      end
      
      it 'should combine the error messages from the entity definition and the entity in the event that is necessary' do
        @entity_definition_errors.stub!(:full_messages).and_return(['britton entity definition'])
        @entity_errors.stub!(:full_messages).and_return(['britton entity'])
        @entity_definition.stub!(:errors).and_return(@entity_definition_errors)
        @entity.stub!(:errors).and_return(@entity_errors)

        post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
        flash[:error].should == "Error: britton entity definition<br />britton entity"
      end
      
      it 'should render new' do
        post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
        response.should render_template(:new)
      end
    end
  end
end
