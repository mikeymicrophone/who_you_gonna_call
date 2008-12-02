require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aliases/edit.html.erb" do
  include AliasesHelper
  
  before(:each) do
    assigns[:alias] = @alias = stub_model(Alias,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/aliases/edit.html.erb"
    
    response.should have_tag("form[action=#{alias_path(@alias)}][method=post]") do
      with_tag('input#alias_name[name=?]', "alias[name]")
    end
  end
end


