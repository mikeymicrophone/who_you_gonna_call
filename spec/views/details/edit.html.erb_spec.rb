require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/details/edit.html.erb" do
  include DetailsHelper
  
  before(:each) do
    assigns[:detail] = @detail = stub_model(Detail,
      :new_record? => false,
      :content => "value for content",
      :target_type => "value for target_type"
    )
  end

  it "should render edit form" do
    render "/details/edit.html.erb"
    
    response.should have_tag("form[action=#{detail_path(@detail)}][method=post]") do
      with_tag('textarea#detail_content[name=?]', "detail[content]")
      with_tag('input#detail_target_type[name=?]', "detail[target_type]")
    end
  end
end


