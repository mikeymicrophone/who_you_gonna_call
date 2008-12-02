require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/alias_uses/index.html.erb" do
  include AliasUsesHelper
  
  before(:each) do
    assigns[:alias_uses] = [
      stub_model(AliasUse,
        :target_type => AliasUse.targets(:capitalized).first
      ),
      stub_model(AliasUse,
        :target_type => AliasUse.targets(:capitalized).first
      )
    ]
  end

  it "should render list of alias_uses" do
    render "/alias_uses/index.html.erb"
    response.should have_tag("tr>td", AliasUse.targets(:capitalized).first, 2)
  end
end

