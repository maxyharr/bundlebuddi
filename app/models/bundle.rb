class Bundle < ApplicationRecord
  has_many :bundle_subscriptions
  has_many :subscriptions, through: :bundle_subscriptions
  belongs_to :user

  def prebundled_cost_in_cents
    subscriptions.pluck(:cost_in_cents).sum
  end
end
