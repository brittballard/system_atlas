require 'spec_helper'

describe Person do
  it 'should respond to email, first_name, last_name, is_owner, organization' do
    Person.new.should respond_to(:email, :first_name, :last_name, :is_owner, :organization)
  end
  
  describe 'after create' do
    before do
      Factory.create(:user, :email => 'johnny.appleseed@chilis.com')
      Factory.create(:user, :email => 'johnny.appleseed@olivegarden.com')
    end
    
    describe 'a user exists with the same email' do
      before do
        @person = Factory.create(:person, :email => 'johnny.appleseed@chilis.com')
      end
      
      it 'should associate the user with the person' do
        @person.user.should be
        @person.email.should == @person.user.email
      end
    end
    
    describe 'a user does not exist with the same email' do
      it 'should not associate a user with the person' do
        person = Factory.create(:person, :email => 'johnny.appleseed@fridays.com')
        person.user.should_not be
      end
    end
  end
end
