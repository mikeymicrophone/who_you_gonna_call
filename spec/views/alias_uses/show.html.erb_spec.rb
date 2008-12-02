require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/alias_uses/show.html.erb" do
  include AliasUsesHelper
  
  before(:each) do
    assigns[:alias_use] = @alias_use = stub_model(AliasUse,
      :target_type => "value for target_type"
    )
  end

  it "should render attributes in <p>" do
    render "/alias_uses/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

