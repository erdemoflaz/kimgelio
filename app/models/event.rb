class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :delete_all
end
