require 'spec_helper'

describe "applications/index" do
  before(:each) do
    assign(:applications, [
      FactoryGirl.create(:application),
      FactoryGirl.create(:application)
    ])
  end

  it "renders a list of applications" do
    render
  end
end
