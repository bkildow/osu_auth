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

end