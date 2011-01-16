require 'spec_helper'

describe "applications/show.html.erb" do
  before(:each) do
    @application = assign(:application, stub_model(Application))
  end

  it "renders attributes in <p>" do
    render
  end
end
