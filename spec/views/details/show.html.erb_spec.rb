require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/details/show.html.erb" do
  include DetailsHelper
  
  before(:each) do
    assigns[:detail] = @detail = stub_model(Detail,
      :content => "value for content",
      :target_type => "value for target_type"
    )
  end

  it "should render attributes in <p>" do
    render "/details/show.html.erb"
    response.should have_text(/value\ for\ content/)
    response.should have_text(/value\ for\ target_type/)
  end
end

