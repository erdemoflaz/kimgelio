class Event < ApplicationRecord
  belongs_to :user
  has_many :invitation, dependent: :destroy
end
