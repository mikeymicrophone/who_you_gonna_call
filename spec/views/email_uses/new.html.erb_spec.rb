require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/email_uses/new.html.erb" do
  include EmailUsesHelper
  
  before(:each) do
    assigns[:email_use] = stub_model(EmailUse,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/email_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", email_uses_path) do
      with_tag("input#email_use_target_type[name=?]", "email_use[target_type]")
    end
  end
end


