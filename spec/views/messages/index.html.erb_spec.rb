require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/index.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:messages] = [
      stub_model(Message,
        :status => "value for status"
      ),
      stub_model(Message,
        :status => "value for status"
      )
    ]
  end

  it "should render list of messages" do
    render "/messages/index.html.erb"
    response.should have_tag("tr>td", "value for status", 2)
  end
end

