class Server < ActiveRecord::Base
  acts_as_token_authenticatable

  belongs_to :user
  has_many :logs
  validates :user_id, presence: true

  def self.authenticate(email, token)
    user = User.find_by_email(email)
    user.servers.find_by(authentication_token: token) rescue nil
  end
end
