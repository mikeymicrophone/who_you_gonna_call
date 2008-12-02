require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parties/index.html.erb" do
  include PartiesHelper
  
  before(:each) do
    assigns[:parties] = [
      stub_model(Party,
        :target_type => "value for target_type"
      ),
      stub_model(Party,
        :target_type => "value for target_type"
      )
    ]
  end

  it "should render list of parties" do
    render "/parties/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

