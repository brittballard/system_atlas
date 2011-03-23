require 'spec_helper'

describe Team do
  it 'should respond to name, description, organization' do
    Team.new.should respond_to(:name, :description, :organization)
  end
end
