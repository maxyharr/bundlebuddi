class BundleSubscription < ApplicationRecord
  validates_presence_of :subscription_id, :bundle_id
  belongs_to :bundle
  belongs_to :subscription
end