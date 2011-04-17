require 'spec_helper'

describe Person do
  it 'should respond to email, first_name, last_name, is_owner, organization' do
    Person.new.should respond_to(:email, :first_name, :last_name, :is_owner, :organization)
  end
end
