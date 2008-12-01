require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false,
      :status => "value for status",
    )
  end

  it "should render edit form" do
    render "/messages/edit.html.erb"
    
    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
      with_tag('input#message_status[name=?]', "message[status]")
    end
  end
end


