require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/index.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:people] = [
      stub_model(Person,
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
      ),
      stub_model(Person,
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
      )
    ]
  end

  it "should render list of people" do
    render "/people/index.html.erb"
    response.should have_tag("tr>td", "value for first_name", 2)
    response.should have_tag("tr>td", "value for middle_name", 2)
    response.should have_tag("tr>td", "value for last_name", 2)
  end
end

