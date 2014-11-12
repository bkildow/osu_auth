require 'rails_helper'

module OsuAuth
  describe Role do
    it 'should correctly save role name' do
      role = build(:osu_auth_role)
      expect(role.name).to eq('Super Admin')
    end

    it 'should create associations' do
      membership = build(:osu_auth_role_membership)
      expect(Role.first.name).to eq('Super Admin')
      expect(User.first.first_name).to eq('Brutus')
    end
  end
end
