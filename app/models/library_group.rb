# -*- encoding: utf-8 -*-
class LibraryGroup < ActiveRecord::Base
  #include Singleton
  include MasterModel

  has_many :libraries
  has_many :colors
  belongs_to :country

  validates :url, presence: true, url: true
  accepts_nested_attributes_for :colors, update_only: true

  def self.site_config
    LibraryGroup.find(1)
  end

  def self.system_name(locale = I18n.locale)
    LibraryGroup.site_config.display_name.localize(locale)
  end

  def config?
    true if self == LibraryGroup.site_config
  end

  def real_libraries
    # 物理的な図書館 = IDが1以外
    libraries.where('id != 1').all
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

  def user
    User.find(1)
  end
end

# == Schema Information
#
# Table name: library_groups
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  display_name   :text
#  short_name     :string(255)      not null
#  my_networks    :text
#  login_banner   :text
#  note           :text
#  country_id     :integer
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  admin_networks :text
#  url            :string(255)      default("http://localhost:3000/")
#
