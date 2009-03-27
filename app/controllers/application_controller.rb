# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :load_user_into_ar
  before_filter :prefix_params, :only => [:new, :create]

  before_filter :require_user
  private
    def prefix_params
      ids = params.select { |k, v| k =~ /_id/ }
      ids.reject { |k, v| k =~ /#{controller_name}/ } # shouldn't hit anyway because this is only for the new and create actions
      params[controller_name.singularize] ||= {}
      model = controller_name.singularize.camelize.constantize
      ids.each do |k, v|
        debugger
        if model.new.respond_to?(k)
          params[controller_name.singularize][k] = v
        else
          params[controller_name.singularize]['target_id'] = v
          k =~ /(\w+)_id/
          params[controller_name.singularize]['target_type'] = $1.camelize
        end
      end
    end
  
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
      ActiveRecord::Base.send(:default_scope, :conditions => {:creator_id => @current_user})
    end
  
end

class Array
  def map_name_and_id
    map { |a| txt = (a.name.blank? ? a.other_name : a.name); [txt, a.id] }
  end
end