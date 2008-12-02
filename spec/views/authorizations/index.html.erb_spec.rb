require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/index.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorizations] = [
      stub_model(Authorization,
        :target_type => Authorization.targets(:capitalized).first
      ),
      stub_model(Authorization,
        :target_type => Authorization.targets(:capitalized).first
      )
    ]
  end

  it "should render list of authorizations" do
    render "/authorizations/index.html.erb"
    response.should have_tag("tr>td", Authorization.targets(:capitalized).first, 2)
  end
end

