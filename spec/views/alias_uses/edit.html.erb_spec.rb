require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/alias_uses/edit.html.erb" do
  include AliasUsesHelper
  
  before(:each) do
    assigns[:alias_use] = @alias_use = stub_model(AliasUse,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/alias_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{alias_use_path(@alias_use)}][method=post]") do
      with_tag('input#alias_use_target_type[name=?]', "alias_use[target_type]")
    end
  end
end


