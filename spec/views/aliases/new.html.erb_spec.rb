require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aliases/new.html.erb" do
  include AliasesHelper
  
  before(:each) do
    assigns[:alias] = stub_model(Alias,
      :new_record? => true,
      :name => "value for name",
    )
  end

  it "should render new form" do
    render "/aliases/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", aliases_path) do
      with_tag("input#alias_name[name=?]", "alias[name]")
    end
  end
end


