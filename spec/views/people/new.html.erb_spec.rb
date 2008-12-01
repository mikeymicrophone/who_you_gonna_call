require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/new.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:person] = stub_model(Person,
      :new_record? => true,
      :first_name => "value for first_name",
      :middle_name => "value for middle_name",
      :last_name => "value for last_name",
    )
  end

  it "should render new form" do
    render "/people/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", people_path) do
      with_tag("input#person_first_name[name=?]", "person[first_name]")
      with_tag("input#person_middle_name[name=?]", "person[middle_name]")
      with_tag("input#person_last_name[name=?]", "person[last_name]")
    end
  end
end


