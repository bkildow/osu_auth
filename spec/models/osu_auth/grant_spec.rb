require 'rails_helper'

module OsuAuth
  describe Grant do
    it 'should correctly save a grant' do
      role = build(:osu_auth_role)
      grant = build(:osu_auth_grant, role_id: role.id, permission: 'edit_user')
      expect(grant.permission).to eq('edit_user')
    end
  end
end
