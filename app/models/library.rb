class Library < ActiveRecord::Base
  include MasterModel
  scope :real, -> { where(in_use: false) }
  has_many :shelves
  belongs_to :library_group
  has_many :profiles
  belongs_to :country

  extend FriendlyId
  friendly_id :name
  geocoded_by :address
  translates :display_name, :short_display_name

  searchable do
    text :name, :note, :address
    text :display_name_translations
    time :created_at
    time :updated_at
    integer :position
  end

  validates :short_display_name, presence: true
  validates :library_group, presence: true
  # validates_uniqueness_of :short_display_name, case_sensitive: false
  validates :isil, uniqueness: { allow_blank: true }
  # validates :display_name, uniqueness: true
  validates :name, format: { with: /\A[a-z][0-9a-z\-_]{1,253}[0-9a-z]\Z/ }
  validates :isil, format: { with: /\A[A-Za-z]{1,4}-[A-Za-z0-9\/:\-]{2,11}\z/ }, allow_blank: true
  after_validation :geocode, if: :address_changed?
  after_create :create_shelf
  after_save :clear_all_cache
  after_destroy :clear_all_cache

  paginates_per 10

  def self.all_cache
    if Rails.env.production?
      Rails.cache.fetch('library_all'){ Library.all }
    else
      Library.all
    end
  end

  def clear_all_cache
    Rails.cache.delete('library_all')
  end

  def create_shelf
    shelf = Shelf.new
    shelf.name = "#{name}_default"
    shelf.library = self
    shelf.save!
  end

  def web?
    return true if name == 'web'
    false
  end

  def self.web
    Shelf.find_by(name: 'web').library
  end

  def address(locale = I18n.locale)
    case locale.to_sym
    when :ja
      "#{region.to_s.localize(locale)}#{locality.to_s.localize(locale)}#{street.to_s.localize(locale)}"
    else
      "#{street.to_s.localize(locale)} #{locality.to_s.localize(locale)} #{region.to_s.localize(locale)}"
    end
  rescue Psych::SyntaxError
    nil
  end

  def address_changed?
    return true if region_changed? || locality_changed? || street_changed?
    false
  end

  if defined?(EnjuEvent)
    has_many :events

    def closed?(date)
      events.closing_days.map{ |c|
        c.start_at.beginning_of_day
      }.include?(date.beginning_of_day)
    end
  end

  if defined?(EnjuInterLibraryLoan)
    has_many :inter_library_loans, foreign_key: 'borrowing_library_id'
  end
end

# == Schema Information
#
# Table name: libraries
#
#  id                              :uuid             not null, primary key
#  name                            :string           not null
#  display_name_translations       :jsonb
#  short_display_name_translations :jsonb
#  zip_code                        :string
#  street                          :text
#  locality                        :text
#  region                          :text
#  telephone_number_1              :string
#  telephone_number_2              :string
#  fax_number                      :string
#  note                            :text
#  call_number_rows                :integer          default(1), not null
#  call_number_delimiter           :string           default("|"), not null
#  library_group_id                :uuid             not null
#  users_count                     :integer          default(0), not null
#  position                        :integer
#  country_id                      :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  opening_hour                    :text
#  isil                            :string
#  latitude                        :float
#  longitude                       :float
#  in_use                          :boolean          default(FALSE), not null
#
