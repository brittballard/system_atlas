require 'spec_helper'

describe PeopleController do
  before do
    activate_authlogic
    UserSession.create(Factory(:user))
  end
  
  describe 'create' do
    it 'should create a person' do
      post :create, { :person => Factory.attributes_for(:person).merge({ :entity_attributes => { :system_identifier => '' } }) }
    end
  end
end
