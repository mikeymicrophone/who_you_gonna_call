require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parties/show.html.erb" do
  include PartiesHelper
  
  before(:each) do
    assigns[:party] = @party = stub_model(Party,
      :target_type => Party.targets(:capitalized).first
    )
  end

  it "should render attributes in <p>" do
    render "/parties/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

