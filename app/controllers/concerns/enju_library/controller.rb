module EnjuLibrary
  module Controller
    extend ActiveSupport::Concern

    private

    def get_library_group
      @library_group = LibraryGroup.site_config
    end

    def get_shelf
      if params[:shelf_id]
        @shelf = Shelf.includes(:library).find(params[:shelf_id])
        authorize @shelf, :show?
      end
    end

    def get_library
      if params[:library_id]
        @library = Library.find(params[:library_id])
        authorize @library, :show?
      end
    end

    def get_libraries
      @libraries = Library.all_cache
    end

    def get_bookstore
      if params[:bookstore_id]
        @bookstore = Bookstore.find(params[:bookstore_id])
        authorize @bookstore, :show?
      end
    end

    def get_subscription
      if params[:subscription_id]
        @subscription = Subscription.find(params[:subscription_id])
        authorize @subscription, :show?
      end
    end
  end
end
