# == Schema Information
#
# Table name: shelves
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  display_name :text
#  note         :text
#  library_id   :integer          default(1), not null
#  items_count  :integer          default(0), not null
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  deleted_at   :datetime
#  closed       :boolean          default(FALSE), not null
#

module ShelvesHelper
  def library_shelf_facet(current_library, facet)
    library = Library.where(name: facet.value).select([:name, :display_name]).first
    return nil unless library
    current = true if current_library.try(:name) == library.name
    content_tag :li do
      if current
        content_tag :strong do
          link_to("#{library.display_name.localize} (" + facet.count.to_s + ")", url_for(params.permit.merge(page: nil, library_id: library.name, only_path: true)))
        end
      else
        link_to("#{library.display_name.localize} (" + facet.count.to_s + ")", url_for(params.permit.merge(page: nil, library_id: library.name, only_path: true)))
      end
    end
  end
end
