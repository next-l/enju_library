class LibraryGroup < ActiveRecord::Base
  #include Singleton
  include MasterModel

  has_many :libraries
  has_many :colors
  belongs_to :country
  belongs_to :user

  validates :url, presence: true, url: true
  validates :max_number_of_results, numericality: {
      greater_than_or_equal_to: 0
    }
  accepts_nested_attributes_for :colors, update_only: true
  accepts_nested_attributes_for :user, update_only: true
  translates :display_name, :login_banner, :footer_banner

  def self.site_config
    LibraryGroup.order(:created_at).first
  end

  def self.system_name(locale = I18n.locale)
    LibraryGroup.site_config.display_name
  end

  def config?
    true if self == LibraryGroup.site_config
  end

  def real_libraries
    libraries.where.not(name: 'web')
  end

  def network_access_allowed?(ip_address, options = {})
    options = { network_type: :lan }.merge(options)
    client_ip = IPAddr.new(ip_address)
    case options[:network_type]
    when :admin
      allowed_networks = admin_networks.to_s.split
    else
      allowed_networks = my_networks.to_s.split
    end
    allowed_networks.each do |allowed_network|
      begin
        network = IPAddr.new(allowed_network)
        return true if network.include?(client_ip)
      rescue ArgumentError
        nil
      end
    end
    return false
  end
end

# == Schema Information
#
# Table name: library_groups
#
#  id                            :integer          not null, primary key
#  name                          :string           not null
#  display_name_translations     :jsonb
#  short_name                    :string           not null
#  my_networks                   :cidr
#  login_banner_translations     :jsonb
#  note                          :text
#  country_id                    :integer
#  position                      :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  admin_networks                :cidr
#  url                           :string           default("http://localhost:3000/")
#  footer_banner_translations    :jsonb
#  html_snippet                  :text
#  book_jacket_source            :string
#  max_number_of_results         :integer          default(500)
#  family_name_first             :boolean          default(TRUE)
#  screenshot_generator          :string
#  pub_year_facet_range_interval :integer          default(10)
#  user_id                       :integer
#
