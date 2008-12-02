require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aliases/show.html.erb" do
  include AliasesHelper
  
  before(:each) do
    assigns[:alias] = @alias = stub_model(Alias,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/aliases/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

