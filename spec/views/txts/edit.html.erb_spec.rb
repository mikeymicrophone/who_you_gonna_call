require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/txts/edit.html.erb" do
  include TxtsHelper
  
  before(:each) do
    assigns[:txt] = @txt = stub_model(Txt,
      :new_record? => false,
      :status => "value for status",
    )
  end

  it "should render edit form" do
    render "/txts/edit.html.erb"
    
    response.should have_tag("form[action=#{txt_path(@txt)}][method=post]") do
      with_tag('input#txt_status[name=?]', "txt[status]")
    end
  end
end


