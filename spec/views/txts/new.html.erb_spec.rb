require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/txts/new.html.erb" do
  include TxtsHelper
  
  before(:each) do
    assigns[:txt] = stub_model(Txt,
      :new_record? => true,
      :status => "value for status",
    )
  end

  it "should render new form" do
    render "/txts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", txts_path) do
      with_tag("input#txt_status[name=?]", "txt[status]")
    end
  end
end


