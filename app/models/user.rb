class User < ApplicationRecord
  before_create :create_api_key

  validates_presence_of :name, :email, :api_key

  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  private
  def create_api_key
    self.api_key = SecureRandom.hex(16)
  end
end