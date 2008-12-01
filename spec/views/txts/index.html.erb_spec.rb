require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/txts/index.html.erb" do
  include TxtsHelper
  
  before(:each) do
    assigns[:txts] = [
      stub_model(Txt,
        :status => "value for status",
      ),
      stub_model(Txt,
        :status => "value for status",
      )
    ]
  end

  it "should render list of txts" do
    render "/txts/index.html.erb"
    response.should have_tag("tr>td", "value for status", 2)
  end
end

