# frozen_string_literal: true

# User model validations
class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 100 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
#   has_secure_password

#   def self.digest(string)
#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
#     BCrypt::Password.create(string, cost: cost)
#   end
end
