require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/new.html.erb" do
  include PhonesHelper
  
  before(:each) do
    assigns[:phone] = stub_model(Phone,
      :new_record? => true,
      :number => "value for number",
      :area_code => "value for area_code",
      :country_code => "value for country_code",
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/phones/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", phones_path) do
      with_tag("input#phone_number[name=?]", "phone[number]")
      with_tag("input#phone_area_code[name=?]", "phone[area_code]")
      with_tag("input#phone_country_code[name=?]", "phone[country_code]")
      with_tag("input#phone_name[name=?]", "phone[name]")
    end
  end
end


