require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = stub_model(Message,
      :new_record? => true,
      :status => "value for status"
    )
  end

  it "should render new form" do
    render "/messages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("input#message_status[name=?]", "message[status]")
    end
  end
end


