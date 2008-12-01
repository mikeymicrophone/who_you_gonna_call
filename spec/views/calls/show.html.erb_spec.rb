require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calls/show.html.erb" do
  include CallsHelper
  
  before(:each) do
    assigns[:call] = @call = stub_model(Call,
      :target_type => "value for target_type",
      :status => "value for status",
    )
  end

  it "should render attributes in <p>" do
    render "/calls/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
    response.should have_text(/value\ for\ status/)
  end
end

