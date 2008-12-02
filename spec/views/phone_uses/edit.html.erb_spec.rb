require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/edit.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    assigns[:phone_use] = @phone_use = stub_model(PhoneUse,
      :new_record? => false,
      :target_type => PhoneUse.targets(:capitalized).first
    )
  end

  it "should render edit form" do
    render "/phone_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{phone_use_path(@phone_use)}][method=post]") do
      with_tag('input#phone_use_target_type[name=?]', "phone_use[target_type]")
    end
  end
end


