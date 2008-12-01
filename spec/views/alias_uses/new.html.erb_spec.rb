require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/alias_uses/new.html.erb" do
  include AliasUsesHelper
  
  before(:each) do
    assigns[:alias_use] = stub_model(AliasUse,
      :new_record? => true,
      :target_type => "value for target_type",
    )
  end

  it "should render new form" do
    render "/alias_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", alias_uses_path) do
      with_tag("input#alias_use_target_type[name=?]", "alias_use[target_type]")
    end
  end
end


