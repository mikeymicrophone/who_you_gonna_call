require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/streets/new.html.erb" do
  include StreetsHelper
  
  before(:each) do
    assigns[:street] = stub_model(Street,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/streets/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", streets_path) do
      with_tag("input#street_name[name=?]", "street[name]")
    end
  end
end


