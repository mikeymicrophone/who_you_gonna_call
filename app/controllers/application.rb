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
  def self.scope_down controller, parameters, *associated_ids
    set = nil
    associated_ids.each do |c|
      if set.nil? && parameters["#{c}_id"]
        set = controller.instance_variable_set("@#{c}", c.capitalize.constantize.send(:find, parameters["#{c}_id"])).send(self.name.underscore.pluralize)
      end
    end
    return set || all
  end
  
  def self.scope_targets
    targets(:select).each do |s, c|
      named_scope s, :conditions => {:target_type => c}
    end
  end  

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
  
  def self.map_name_and_id
    all.map { |a| txt = (a.name.blank? ? a.other_name : a.name); [txt, a.id] }
  end
end

class Array
  def map_name_and_id
    map { |a| txt = (a.name.blank? ? a.other_name : a.name); [txt, a.id] }
  end
end