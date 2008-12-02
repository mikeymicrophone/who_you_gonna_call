require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/new.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorization] = stub_model(Authorization,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/authorizations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", authorizations_path) do
      with_tag("input#authorization_target_type[name=?]", "authorization[target_type]")
    end
  end
end


