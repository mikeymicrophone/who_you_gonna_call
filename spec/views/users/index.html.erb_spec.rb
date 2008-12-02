require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :crypted_password => "value for crypted_password",
        :password_salt => "value for password_salt",
        :persistence_token => "value for persistence_token",
        :login_count => "1",
        :last_login_ip => "value for last_login_ip",
        :current_login_ip => "value for current_login_ip"
      ),
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :crypted_password => "value for crypted_password",
        :password_salt => "value for password_salt",
        :persistence_token => "value for persistence_token",
        :login_count => "1",
        :last_login_ip => "value for last_login_ip",
        :current_login_ip => "value for current_login_ip"
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "value for login", 2)
    response.should have_tag("tr>td", "value for email", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for last_login_ip", 2)
    response.should have_tag("tr>td", "value for current_login_ip", 2)
  end
end

