require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/edit.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:service] = @service = stub_model(Service,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/services/edit.html.erb"
    
    response.should have_tag("form[action=#{service_path(@service)}][method=post]") do
      with_tag('input#service_name[name=?]', "service[name]")
    end
  end
end


