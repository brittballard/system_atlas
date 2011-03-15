require 'spec_helper'

describe User do
  describe 'creating a user' do
    it 'should create a person after saving a user' do
      new_user = Factory.create(:user)
      Person.where('email = ?', new_user.email).count.should eql(1)
    end
  end
end
