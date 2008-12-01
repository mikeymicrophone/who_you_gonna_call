require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guests/show.html.erb" do
  include GuestsHelper
  
  before(:each) do
    assigns[:guest] = @guest = stub_model(Guest,
      :target_type => "value for target_type",
      :status => "value for status",
    )
  end

  it "should render attributes in <p>" do
    render "/guests/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
    response.should have_text(/value\ for\ status/)
  end
end

