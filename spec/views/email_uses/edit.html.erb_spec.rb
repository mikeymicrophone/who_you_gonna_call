require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/email_uses/edit.html.erb" do
  include EmailUsesHelper
  
  before(:each) do
    assigns[:email_use] = @email_use = stub_model(EmailUse,
      :new_record? => false,
      :target_type => EmailUse.targets(:capitalized).first
    )
  end

  it "should render edit form" do
    render "/email_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{email_use_path(@email_use)}][method=post]") do
      with_tag('input#email_use_target_type[name=?]', "email_use[target_type]")
    end
  end
end


