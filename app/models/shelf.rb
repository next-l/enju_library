class Shelf < ApplicationRecord
  include MasterModel
  scope :real, -> { where('library_id != 1') }
  belongs_to :library, validate: true
  has_many :items
  has_many :picture_files, as: :picture_attachable, dependent: :destroy

  validates_associated :library
  validates :library, presence: true
  validates_uniqueness_of :display_name, scope: :library_id
  validates :name, format: { with: /\A[a-z][0-9a-z\-_]{1,253}[0-9a-z]\Z/ }
  before_update :reset_position

  acts_as_list scope: :library
  translates :display_name

  searchable do
    string :shelf_name do
      name
    end
    string :library do
      library.name
    end
    text :name do
      [name, library.name, display_name, library.display_name]
    end
    integer :position
  end

  paginates_per 10

  def web_shelf?
    return true if id == 1
    false
  end

  def self.web
    Shelf.find(1)
  end

  def localized_display_name
    display_name
  end

  # http://stackoverflow.com/a/12437606
  def reset_position
    if library_id_changed?
      self.position = library.shelves.count > 0 ? library.shelves.last.position + 1 : 1
    end
  end
end

# == Schema Information
#
# Table name: shelves
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  display_name              :text
#  note                      :text
#  library_id                :bigint           not null
#  items_count               :integer          default(0), not null
#  position                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  closed                    :boolean          default(FALSE), not null
#  display_name_translations :jsonb            not null
#
