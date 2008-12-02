# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :load_user_into_ar

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def load_user_into_ar
      ActiveRecord::Base.instance_variable_set('@current_user', current_user)
    end
  
end

class ActiveRecord::Base
  

  belongs_to :creator, :class_name => 'User'
  
  def current_user_id
    current_user.id if current_user
  end
  
  def current_user
    @current_user ||= ActiveRecord::Base.instance_variable_get('@current_user')
  end
  
  def credit_creator
    self.creator ||= current_user
  end
  before_create :credit_creator
end