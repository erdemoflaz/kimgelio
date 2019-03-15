class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, dependent: :destroy
  has_many :invitation, dependent: :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
