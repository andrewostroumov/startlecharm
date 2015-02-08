class Server < ActiveRecord::Base
  acts_as_token_authenticatable

  belongs_to :user
  has_many :logs
  validates :user_id, presence: true

  def self.authenticate(token)
    Server.find_by_authentication_token(token)
  end
end
