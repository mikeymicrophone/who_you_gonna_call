require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/alias_uses/index.html.erb" do
  include AliasUsesHelper
  
  before(:each) do
    assigns[:alias_uses] = [
      stub_model(AliasUse,
        :target_type => "value for target_type"
      ),
      stub_model(AliasUse,
        :target_type => "value for target_type"
      )
    ]
  end

  it "should render list of alias_uses" do
    render "/alias_uses/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

