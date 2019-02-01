# frozen_string_literal: true

module EnjuLibrary
  module EnjuItem
    extend ActiveSupport::Concern

    def shelf_name
      shelf.name
    end

    def hold?(library)
      return true if shelf.library == library
      false
    end

    def library_url
      "#{LibraryGroup.site_config.url}libraries/#{shelf.library.name}"
    end
  end
end
