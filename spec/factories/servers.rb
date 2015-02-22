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

FactoryGirl.define do
  factory :server do
    distro_name "MyString"
kernel_release "MyString"
uptime 1
ip "MyString"
  end

end
