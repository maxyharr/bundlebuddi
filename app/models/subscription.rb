class Subscription < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost_in_cents
end
