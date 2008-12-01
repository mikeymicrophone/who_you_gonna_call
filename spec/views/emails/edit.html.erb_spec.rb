require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emails/edit.html.erb" do
  include EmailsHelper
  
  before(:each) do
    assigns[:email] = @email = stub_model(Email,
      :new_record? => false,
      :address => "value for address",
    )
  end

  it "should render edit form" do
    render "/emails/edit.html.erb"
    
    response.should have_tag("form[action=#{email_path(@email)}][method=post]") do
      with_tag('input#email_address[name=?]', "email[address]")
    end
  end
end


