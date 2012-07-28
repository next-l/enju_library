module EnjuLibrary
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views', __FILE__)

      def copy_files
        directories = %w(
          bookstores
          budget_types
          libraries
          library_groups
          request_status_types
          request_types
          search_engines
          shelves
          subscribes
          subscriptions
        )

        directories.each do |dir|
          directory dir, "app/views/#{dir}"
        end
      end
    end
  end
end
