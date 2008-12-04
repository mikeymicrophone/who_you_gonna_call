# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :load_user_into_ar
  before_filter :prefix_params, :only => [:new, :create]

  private
    def prefix_params
      ids = params.select { |k, v| k =~ /_id/ }
      ids.reject { |k, v| k =~ /#{controller_name}/ } # shouldn't hit anyway because this is only for the new and create actions
      params[controller_name.singularize] ||= {}
      model = controller_name.singularize.camelize.constantize
      ids.each do |k, v|
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
    end
  
end

class ActiveRecord::Base
  def self.scope_down controller, parameters, *associated_ids
    set = nil
    associated_ids.each do |c|
      if set.nil? && parameters["#{c}_id"]
        scope_object = c.capitalize.constantize.send(:find, parameters["#{c}_id"])
        controller.instance_variable_set("@#{c}", scope_object)
        set = scope_object.send(self.name.underscore.pluralize)
      end
    end
    return set || all
  end
  
  def self.scope_targets
    targets(:select).each do |s, c|
      named_scope s, :conditions => {:target_type => c}
    end
  end
  
  def self.group_targets_of join
    join.singularize.camelize.constantize.send('targets', :sing_plural).each do |singular, plural|
      define_method("#{plural}_from_#{join}") do
        send(join).send(singular).map(&:target)
      end
    end
  end
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      target_list
    when :capital
      targets.map &:camelize
    when :symbol
      targets.map &:to_sym
    when :plural
      targets.map &:pluralize
    when :sing_plural
      targets.zip targets(:plural)
    when :select
      targets.zip targets(:capital)
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