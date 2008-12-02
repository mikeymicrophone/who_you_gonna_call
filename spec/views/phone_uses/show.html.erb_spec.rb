require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/show.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    assigns[:phone_use] = @phone_use = stub_model(PhoneUse,
      :target_type => "value for target_type"
    )
  end

  it "should render attributes in <p>" do
    render "/phone_uses/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

