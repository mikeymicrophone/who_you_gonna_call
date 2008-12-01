require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/streets/edit.html.erb" do
  include StreetsHelper
  
  before(:each) do
    assigns[:street] = @street = stub_model(Street,
      :new_record? => false,
      :name => "value for name",
    )
  end

  it "should render edit form" do
    render "/streets/edit.html.erb"
    
    response.should have_tag("form[action=#{street_path(@street)}][method=post]") do
      with_tag('input#street_name[name=?]', "street[name]")
    end
  end
end


