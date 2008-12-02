require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visits/show.html.erb" do
  include VisitsHelper
  
  before(:each) do
    assigns[:visit] = @visit = stub_model(Visit,
      :target_type => Visit.targets(:capitalized).first,
      :earliest_time => Time.now,
      :latest_time => Time.now
    )
  end

  it "should render attributes in <p>" do
    render "/visits/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

