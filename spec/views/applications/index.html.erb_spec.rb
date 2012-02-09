require 'spec_helper'

describe "applications/index" do
  before(:each) do
    assign(:applications, [
      FactoryGirl.build(:application),
      FactoryGirl.build(:application)
    ])
  end

  it "renders a list of applications" do
    render
  end
end
