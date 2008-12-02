require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visits/index.html.erb" do
  include VisitsHelper
  
  before(:each) do
    assigns[:visits] = [
      stub_model(Visit,
        :target_type => "value for target_type"
      ),
      stub_model(Visit,
        :target_type => "value for target_type"
      )
    ]
  end

  it "should render list of visits" do
    render "/visits/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

