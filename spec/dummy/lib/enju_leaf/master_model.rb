module MasterModel
  def self.included(base)
    #base.extend ClassMethods
    base.send :include, InstanceMethods
    base.class_eval do
      acts_as_list
      validates_uniqueness_of :name, :case_sensitive => false,
        :message => I18n.t('Only lowercase letters and numbers are allowed.')
      validates_presence_of :display_name
      validates :name, :format => {:with => /^[a-z][0-9a-z\-_]{2,254}$/},
        :presence => true
      before_validation :set_display_name, :on => :create
      normalize_attributes :name
    end
  end

  module InstanceMethods
    def set_display_name
      self.display_name = "#{I18n.locale}: #{self.name}" if self.display_name.blank?
    end
  end
end
