require 'spec_helper'

describe ApplicationServer do
  it 'should respond to name, description, and entity' do
    ApplicationServer.new.should respond_to(:name, :description, :entity, :web_server, :organization)
  end
end
