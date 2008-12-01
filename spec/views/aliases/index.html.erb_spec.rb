require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aliases/index.html.erb" do
  include AliasesHelper
  
  before(:each) do
    assigns[:aliases] = [
      stub_model(Alias,
        :name => "value for name",
      ),
      stub_model(Alias,
        :name => "value for name",
      )
    ]
  end

  it "should render list of aliases" do
    render "/aliases/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

