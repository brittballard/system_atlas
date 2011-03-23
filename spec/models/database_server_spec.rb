require 'spec_helper'

describe DatabaseServer do
  it 'should respond to name, description, entity, database_software, organization' do
    DatabaseServer.new.should respond_to(:name, :description, :entity, :database_software, :organization)
  end
end
