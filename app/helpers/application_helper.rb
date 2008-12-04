# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def back_link
    link_to_function 'back', 'history.go(-1)'
  end
  
  def edit_link obj
    return unless obj.creator == ActiveRecord::Base.instance_variable_get('@current_user')
    link_to 'edit', send("edit_#{obj.class.name.underscore}_path", obj)
  end
  
  def link_to_name obj
    return if obj.nil?
    text = obj.name.blank? ? obj.other_name : obj.name
    link_to text, obj
  end
  
  def link_to_each obj, *collections
    collections.map { |c| content_tag(:ul, obj.send(c).map { |r| content_tag(:li, link_to_name(r)) }.join) }.join
  end
  
  def new_links obj, *children
    children.map { |c| content_tag(:span, link_to("new #{c}", send("new_#{obj.class.name.underscore}_#{c}_path", obj))) }.join
  end
end
