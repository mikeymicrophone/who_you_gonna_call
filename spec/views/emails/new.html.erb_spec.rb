require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emails/new.html.erb" do
  include EmailsHelper
  
  before(:each) do
    assigns[:email] = stub_model(Email,
      :new_record? => true,
      :address => "value for address",
    )
  end

  it "should render new form" do
    render "/emails/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", emails_path) do
      with_tag("input#email_address[name=?]", "email[address]")
    end
  end
end


