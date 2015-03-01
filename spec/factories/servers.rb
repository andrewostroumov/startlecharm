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
#  state                :string(255)
#

FactoryGirl.define do
  factory :server do
    distro_name "Arch Linux"
    kernel_release "4.0"
    ip { Faker::Internet.ip_v4_address }
    association :user
  end
end
