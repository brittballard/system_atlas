require 'spec_helper'

describe Person do
  it 'should respond to email, first_name, last_name, is_owner, organization' do
    Person.new.should respond_to(:email, :first_name, :last_name, :organization)
  end
  
  describe 'after create' do
    before do
      FactoryGirl.create(:user, :email => 'johnny.appleseed@chilis.com')
      FactoryGirl.create(:user, :email => 'johnny.appleseed@olivegarden.com')
    end
    
    describe 'a user exists with the same email' do
      before do
        @person = FactoryGirl.create(:person, :email => 'johnny.appleseed@chilis.com')
      end
      
      it 'should associate the user with the person' do
        @person.user.should be
        @person.email.should == @person.user.email
      end
    end
    
    describe 'a user does not exist with the same email' do
      it 'should not associate a user with the person' do
        person = FactoryGirl.create(:person, :email => 'johnny.appleseed@fridays.com')
        person.user.should_not be
      end
    end
  end

  describe 'set_as_owner' do
    it 'should create a relationship and mark the person as the owner of the entity when this method is called and the relationship does not exist yet' do
      person = FactoryGirl.create(:person)
      server = FactoryGirl.create(:server)
      
      person.make_owner_of(server)
      EntityRelationship.where({ :child_id => person.entity.id, :parent_id => server.entity.id }).first.is_owner.should == true
    end
    
    it 'should mark the person as the owner of the entity when the relationship already exists' do
      person = FactoryGirl.create(:person)
      server = FactoryGirl.create(:server)
      
      server.entity.children << person.entity
      
      person.make_owner_of(server)
      EntityRelationship.where({ :child_id => person.entity.id, :parent_id => server.entity.id }).count.should == 1
      EntityRelationship.where({ :child_id => person.entity.id, :parent_id => server.entity.id }).first.is_owner.should == true
    end
  end
end
