require 'securerandom'

class User < ApplicationRecord
  before_validation :create_api_key, on: :create

  validates_presence_of :name, :email
  validates :email, uniqueness: true

  private
  def create_api_key
    self.api_key = SecureRandom.hex(16)
  end
end