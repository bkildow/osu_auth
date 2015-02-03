require 'rails_helper'

module OsuAuth
  describe Role do

    let(:grant) { create(:osu_auth_grant) }

    describe 'saving' do
      it 'should correctly save role name' do
        role = build(:osu_auth_role)
        expect(role.name).to eq('Administrator')
      end

      it 'should create associations' do
        build(:osu_auth_role_membership)
        expect(Role.first.name).to eq('Administrator')
        expect(User.first.first_name).to eq('Brutus')
      end
    end

    describe '.permission_ids' do
      it 'should return an array or permission ids' do
        role = Role.find(grant.role_id)
        expect(role.permission_ids).to eq(['edit_user'])
      end
    end

    describe '.has_permission?' do
      it 'should return true if permission is granted' do
        role = Role.find(grant.role_id)
        expect(role.has_permission?('edit_user')).to be_truthy
      end

      it 'should return false if permission is not granted' do
        role = Role.find(grant.role_id)
        expect(role.has_permission?('jump_around')).to be_falsey
      end

    end
  end
end
