require 'rails_helper'

describe OsuAuth::UserPolicy do
  subject { described_class }

  let(:user) { build(:osu_auth_user) }

  permissions :index? do
    it 'allows access if user has view_users' do
      user.permissions = ['view_users']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }

  end

  permissions :show? do
    it 'allows access if user has view_users' do
      user.permissions = ['view_users']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :create? do
    it 'allows access if user has add_user' do
      user.permissions = ['add_user']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :new? do
    it 'allows access if user has add_user' do
      user.permissions = ['add_user']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :update? do
    it 'allows access if user has edit_user' do
      user.permissions = ['edit_user']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :edit? do
    it 'allows access if user has edit_user' do
      user.permissions = ['edit_user']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :destroy? do
    it 'allows access if user has delete_user' do
      user.permissions = ['delete_user']
      expect(subject).to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  permissions :masquerade? do
    it 'denies access if user is not super admin' do
      expect(subject).not_to permit(user, user)
    end

    it { is_expected.not_to permit(user, user) }
  end

  describe '.scope' do
    before(:each) do
      create_list(:osu_auth_user, 2)
      create(:osu_auth_user, super_admin: true)
    end

    it 'should allow super admins to see super admins' do
      auth_user = create(:osu_auth_user, name_n: 'super.1', super_admin: true)
      users = Pundit.policy_scope(auth_user, OsuAuth::User)
      expect(users.count).to eq(4)
    end

    it 'should not allow regular users to see super admins' do
      users = Pundit.policy_scope(user, OsuAuth::User)
      expect(users.count).to eq(2)
    end

  end

end
