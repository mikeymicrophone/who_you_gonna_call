require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/new.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:service] = stub_model(Service,
      :new_record? => true,
      :name => "value for name",
    )
  end

  it "should render new form" do
    render "/services/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", services_path) do
      with_tag("input#service_name[name=?]", "service[name]")
    end
  end
end


