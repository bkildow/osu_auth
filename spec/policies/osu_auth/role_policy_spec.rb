require 'rails_helper'

describe OsuAuth::RolePolicy do
  subject { described_class }
  let(:user) { build(:osu_auth_user) }
  let(:role) { build(:osu_auth_role) }

  permissions :index? do
    it 'allows access if user has view_roles' do
      user.permissions = ['view_roles']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :show? do
    it 'allows access if user has view_roles' do
      user.permissions = ['view_roles']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :create? do
    it 'allows access if user has add_role' do
      user.permissions = ['add_role']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :new? do
    it 'allows access if user has add_role' do
      user.permissions = ['add_role']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :update? do
    it 'allows access if user has edit_role' do
      user.permissions = ['edit_role']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :edit? do
    it 'allows access if user has edit_role' do
      user.permissions = ['edit_role']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end

  permissions :destroy? do
    it 'allows access if user has delete_role' do
      user.permissions = ['delete_role']
      expect(subject).to permit(user, role)
    end

    it { is_expected.not_to permit(user, role) }
  end


end
