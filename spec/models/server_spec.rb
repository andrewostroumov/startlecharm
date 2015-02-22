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

require 'rails_helper'

RSpec.describe Server, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
