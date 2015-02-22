# == Schema Information
#
# Table name: servers
#
#  id                   :integer          not null, primary key
#  distro_name          :string(255)
#  kernel_release       :string(255)
#  uptime               :integer
#  ip                   :string(255)
#  authentication_token :string(255)
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Server < ActiveRecord::Base
  acts_as_token_authenticatable

  belongs_to :user
  has_many :logs
  validates :ip, :user_id, presence: true
  validates :ip, uniqueness: true

  scope :active, -> { where(state: :active) }
  scope :inactive, -> { where(state: :inactive) }

  before_create do
    self.state = :inactive
  end

  def self.authenticate(token)
    Server.find_by_authentication_token(token)
  end

  def activate!
    update_attributes state: :active
  end
end
