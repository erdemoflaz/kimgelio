class Invitation < ApplicationRecord
  validates :userid, uniqueness: { scope: :event_id }
  belongs_to :user
  belongs_to :event
  scope :waiting,  -> { where(status: 0) }
  scope :accepted, -> { where(status: 1) }
  scope :declined, -> { where(status: 2) }
end
