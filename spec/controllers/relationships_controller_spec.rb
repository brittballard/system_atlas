require 'spec_helper'

describe RelationshipsController do
  def setup_application(app)
    app.organization_id = @user.organization_id
    app.entity = FactoryGirl.create(:entity) do |entity|
      entity.organization_id = @user.organization_id
    end
  end

  before do
    @user = Factory(:user)
    sign_in @user
    
    @parent = FactoryGirl.create(:application) do |app|
      setup_application(app)
    end
  end
  
  describe 'GET manage' do
    it 'assigns the requested parent to @parent' do
      get(:manage, { 'entity_id' => @parent.entity.id })
      assigns(:parent).should eq(@parent.entity)
    end
    
    it 'assigns all entities other than the parent or any of the parents children to @entities' do
      child = FactoryGirl.create(:application) do |app|
        setup_application(app)
      end
      
      availableEntity = FactoryGirl.create(:application) do |app|
        setup_application(app)
      end
      
      @parent.children << child.entity
      @parent.save!
      
      get(:manage, { 'entity_id' => @parent.entity.id })
      assigns(:entities).should eq([availableEntity.entity])
    end
  end
end
