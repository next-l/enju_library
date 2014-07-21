class Subscription < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :subscribes, :dependent => :destroy
  has_many :works, :through => :subscribes
  belongs_to :user, :validate => true
  if defined?(EnjuPurchasRequest)
    belongs_to :order_list, :validate => true
  end

  validates_presence_of :title, :user
  validates_associated :user

  index_name "#{name.downcase.pluralize}-#{Rails.env}"

  after_commit on: :create do
    index_document
  end

  after_commit on: :update do
    update_document
  end

  after_commit on: :destroy do
    delete_document
  end

  settings do
    mappings dynamic: 'false', _routing: {required: false} do
      indexes :title
      indexes :note
      indexes :created_at, type: 'date'
      indexes :updaed_at, type: 'date'
      indexes :work_ids, type: 'integer'
    end
  end

  def as_indexed_json(options={})
    as_json.merge(
      work_ids: work_ids
    )
  end

  paginates_per 10

  def subscribed(work)
    subscribes.where(:work_id => work.id).first
  end

end

# == Schema Information
#
# Table name: subscriptions
#
#  id               :integer          not null, primary key
#  title            :text             not null
#  note             :text
#  user_id          :integer
#  order_list_id    :integer
#  deleted_at       :datetime
#  subscribes_count :integer          default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#
