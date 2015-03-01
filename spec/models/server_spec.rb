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

require 'rails_helper'

RSpec.describe Server, type: :model do
  let(:server) { create :server }

  it 'after create state should be inactive' do
    expect(server.state).to eq 'inactive'
  end

  context 'acts_as_token_authenticatable' do
    it 'should not have authentication_token when new record' do
      expect(build(:server).authentication_token).not_to be
    end     
  
    it 'should have authentication_token when persisted' do
      expect(server.authentication_token).to be
    end
  end

  context '.authenticate' do
    context 'with valid token' do
      it 'should return instance of server' do
        authenticated_server = Server.authenticate(server.authentication_token)
        expect(authenticated_server).to eq server
      end
    end

    context 'with invalid token' do
      it 'should return nil' do
        expect(Server.authenticate('invalid token')).to be nil 
      end
    end
  end

  context '#activate!' do
    it 'should update state to active' do
      server.activate!
      expect(server.state).to eq 'active'
    end
  end
end
