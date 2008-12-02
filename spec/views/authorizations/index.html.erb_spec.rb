require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/index.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorizations] = [
      stub_model(Authorization,
        :target_type => "value for target_type"
      ),
      stub_model(Authorization,
        :target_type => "value for target_type"
      )
    ]
  end

  it "should render list of authorizations" do
    render "/authorizations/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

