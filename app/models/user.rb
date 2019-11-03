class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :name, presence: true

  has_many :clocks, class_name: 'Clock', foreign_key: :user_id, dependent: :delete_all
end
