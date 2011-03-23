require 'spec_helper'

describe BusinessUnit do
  it 'should respond to name, description, organization' do
    BusinessUnit.new.should respond_to(:name, :description, :organization)
  end
end
