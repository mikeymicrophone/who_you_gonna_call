class ActiveRecord::Base
  
  def self.scope_down controller, parameters, *associated_ids#, transitive_ids = {}
    set = nil
    associated_ids.each do |c|
      if set.nil? && parameters["#{c}_id"]
        scope_object = c.camelize.constantize.send(:find, parameters["#{c}_id"])
        controller.instance_variable_set("@#{c}", scope_object)
        controller.instance_variable_set("@scope_object", scope_object)
        set = scope_object.send(self.name.underscore.pluralize)
      end
    end
    transitive_ids = {} # not correctly implemented yet
    set || transitive_ids.each do |k, v|
      v.each do |c|
        if set.nil? && parameters["#{c}_id"]
          scope_object = c.camelize.constantize.send(:find, parameters["#{c}_id"])
          controller.instance_variable_set("@#{c}", scope_object)
          controller.instance_variable_set("@scope_object", scope_object)
          set = scope_object.send(k).send(c).map(&:target)
        end
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