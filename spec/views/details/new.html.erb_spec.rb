require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/details/new.html.erb" do
  include DetailsHelper
  
  before(:each) do
    assigns[:detail] = stub_model(Detail,
      :new_record? => true,
      :content => "value for content",
      :target_type => "value for target_type",
    )
  end

  it "should render new form" do
    render "/details/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", details_path) do
      with_tag("textarea#detail_content[name=?]", "detail[content]")
      with_tag("input#detail_target_type[name=?]", "detail[target_type]")
    end
  end
end


