require 'rails_helper'

module OsuAuth
  RSpec.describe Permission, :type => :model do
    it 'should merge permissions config hash' do
      OsuAuth::Permission.config do
        {perm1: 'permission one'}
      end

      expect(OsuAuth::Permission.permissions).to eq({perm1: 'permission one', edit_user: 'can edit users'})
    end
  end
end
