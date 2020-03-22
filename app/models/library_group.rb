class LibraryGroup < ApplicationRecord
  #include Singleton
  include MasterModel

  has_many :libraries, dependent: :destroy
  has_many :colors, dependent: :destroy
  belongs_to :country, optional: true
  belongs_to :user, optional: true

  validates :url, presence: true, url: true
  validates :max_number_of_results, numericality: {
      greater_than_or_equal_to: 1
    }
  accepts_nested_attributes_for :colors, update_only: true
  accepts_nested_attributes_for :user, update_only: true
  store :settings, accessors: [
    :book_jacket_unknown_resource,
    :erms_url
  ], coder: JSON

  translates :login_banner, :footer_banner, :display_name

  if ENV['ENJU_STORAGE'] == 's3'
    has_attached_file :header_logo, storage: :s3, styles: { medium: 'x80'},
      s3_credentials: {
        access_key: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket: ENV['S3_BUCKET_NAME'],
        s3_host_name: ENV['S3_HOST_NAME'],
        s3_region: ENV["S3_REGION"]
      },
      s3_permissions: :private
  else
    has_attached_file :header_logo, styles: { medium: 'x80'},
      path: ":rails_root/private/system/:class/:attachment/:id_partition/:style/:filename"
  end

  validates_attachment_content_type :header_logo, content_type: /\Aimage\/.*\Z/
  attr_accessor :delete_header_logo

  def self.site_config
    LibraryGroup.order(:created_at).first
  end

  def self.system_name(locale = I18n.locale)
    LibraryGroup.site_config.send(:"display_name_#{locale.to_s}")
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

