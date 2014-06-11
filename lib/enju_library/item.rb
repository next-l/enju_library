module EnjuLibrary
  module LibraryItem
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_library_item_model
        include InstanceMethods
        has_one :accept
        scope :accepted_between, lambda{|from, to| includes(:accept).where('items.created_at BETWEEN ? AND ?', Time.zone.parse(from).beginning_of_day, Time.zone.parse(to).end_of_day)}

        belongs_to :shelf, :counter_cache => true, :validate => true
        validates_associated :shelf

        settings do
          mappings dynamic: 'false', _routing: {required: true, path: :required_role_id} do
            indexes :library
          end
        end
      end
    end

    module InstanceMethods
      def as_indexed_json(options={})
        super.merge(
          library: shelf.library.try(:name)
        )
      end

      def shelf_name
        shelf.name
      end

      def hold?(library)
        return true if self.shelf.library == library
        false
      end

      def library_url
        "#{LibraryGroup.site_config.url}libraries/#{self.shelf.library.name}"
      end
    end
  end
end
