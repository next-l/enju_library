module ApplicationHelper
  include EnjuBiblio::BiblioHelper

  def back_to_index(options = {})
    if options == nil
      options = {}
    else
      options.reject!{|key, value| value.blank?}
      options.delete(:page) if options[:page].to_i == 1
    end
    unless controller_name == 'test'
      link_to t('page.listing', :model => t("activerecord.models.#{controller_name.singularize}")), url_for(params.merge(:controller => controller_name, :action => :index, :id => nil, :only_path => true).merge(options))
    end
  end
end
