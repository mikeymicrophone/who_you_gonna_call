require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/txts/show.html.erb" do
  include TxtsHelper
  
  before(:each) do
    assigns[:txt] = @txt = stub_model(Txt,
      :status => "value for status"
    )
  end

  it "should render attributes in <p>" do
    render "/txts/show.html.erb"
    response.should have_text(/value\ for\ status/)
  end
end

