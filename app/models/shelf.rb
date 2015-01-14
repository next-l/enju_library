class Shelf < ActiveRecord::Base
  include MasterModel
  scope :real, -> { where('library_id != 1') }
  belongs_to :library, validate: true
  has_many :items
  has_many :picture_files, as: :picture_attachable, dependent: :destroy

  validates_associated :library
  validates :library, presence: true
  validates_uniqueness_of :display_name, scope: :library_id
  validates :name, format: { with: /\A[a-z][0-9a-z\-_]{1,253}[0-9a-z]\Z/ }

  acts_as_list scope: :library

  searchable do
    string :name
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
    display_name.localize
  end
end

# == Schema Information
#
# Table name: shelves
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  display_name :text
#  note         :text
#  library_id   :integer          default(1), not null
#  items_count  :integer          default(0), not null
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#  closed       :boolean          default(FALSE), not null
#

