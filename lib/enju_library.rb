require "enju_library/engine"
require "enju_library/item"

module EnjuLibrary
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def enju_library
      include EnjuLibrary::InstanceMethods
    end
  end

  module InstanceMethods
    private

    def get_library_group
      @library_group = LibraryGroup.site_config
    end

    def get_shelf
      @shelf = Shelf.includes(:library).find(params[:shelf_id]) if params[:shelf_id]
    end

    def get_library
      @library = Library.friendly.find(params[:library_id]) if params[:library_id]
    end

    def get_libraries
      @libraries = Library.all_cache
    end

    def get_bookstore
      @bookstore = Bookstore.find(params[:bookstore_id]) if params[:bookstore_id]
    end

    def get_subscription
      @subscription = Subscription.find(params[:subscription_id]) if params[:subscription_id]
    end
  end
end

ActiveRecord::Base.send :include, EnjuLibrary::LibraryItem
ActionController::Base.send(:include, EnjuLibrary)
