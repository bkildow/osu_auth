require 'rails_helper'

module OsuAuth
  describe User do

    let(:user) { create(:osu_auth_user, name_n: 'buckeye.1') }

    # Create three roles
    let(:admin) { create(:osu_auth_role, name: 'admin') }
    let(:editor) { create(:osu_auth_role, name: 'editor') }
    let(:viewer) { create(:osu_auth_role, name: 'viewer') }

    # Give each role a different permission, and share one permissions across two roles
    let(:grant_admin_delete) { create(:osu_auth_grant, role: admin, permission: 'delete_user') }
    let(:grant_editor_edit) { create(:osu_auth_grant, role: editor, permission: 'edit_user') }
    let(:grant_viewer_view) { create(:osu_auth_grant, role: viewer, permission: 'view_user') }
    let(:grant_admin_view) { create(:osu_auth_grant, role: admin, permission: 'view_user') }

    # Assign admin, editor, and viewer roles to user
    let(:admin_membership) { create(:osu_auth_role_membership, user: user, role: admin) }
    let(:editor_membership) { create(:osu_auth_role_membership, user: user, role: editor) }
    let(:viewer_membership) { create(:osu_auth_role_membership, user: user, role: viewer) }

    describe 'permission checking' do

      before(:each) do
        # set up role membership
        [admin_membership, editor_membership, viewer_membership]

        # set up role permissions
        [grant_admin_delete, grant_editor_edit, grant_viewer_view, grant_admin_view]
      end

      describe '.can?' do
        it 'should be true for permissions assigned' do
          expect(user.can? 'delete_user').to be_truthy
          expect(user.can? 'view_user').to be_truthy
          expect(user.can? 'edit_user').to be_truthy
        end

        it 'should be false for permissions not assigned' do
          # Remove the admin role from user
          admin_membership.destroy

          expect(user.can? 'delete_user').to be_falsey
          expect(user.can? 'view_user').to be_truthy
        end

        it 'should not fail if no roles are assigned' do
          admin_membership.destroy
          editor_membership.destroy
          viewer_membership.destroy

          expect(user.can? 'delete_user').to be_falsey
          expect(user.can? 'view_user').to be_falsey
          expect(user.can? 'edit_user').to be_falsey
        end

        it 'should bypass permissions if super_admin is true' do
          admin_membership.destroy
          editor_membership.destroy
          viewer_membership.destroy

          user.super_admin = true
          expect(user.can? 'delete_user').to be_truthy
          expect(user.can? 'view_user').to be_truthy
          expect(user.can? 'edit_user').to be_truthy
        end
      end

      describe '.permissions' do
        it 'should return an array of permissions assigned through roles' do
          expect(user.permissions).to eq(%w(delete_user view_user edit_user))
        end
      end

    end

    describe '.omniauth' do
      it 'should create a user when one does not exist' do
        auth_hash = {emplid: 1234, name_n: 'smith.1', first_name: 'Bob', last_name: 'Smith'}
        User.omniauth(auth_hash)
        expect(User.first.first_name).to eq('Bob')
      end

      it 'should find a user by emplid and update it' do
        # build the user factory
        last_name = user.last_name

        auth_hash = {emplid: 111111111, first_name: 'Bob'}
        auth_user = User.omniauth(auth_hash)

        expect(auth_user.last_name).to eq(last_name)
      end

      it 'should find a user by name_n and update it' do
        # build the user factory
        last_name = user.last_name

        auth_hash = {name_n: 'buckeye.1'}
        auth_user = User.omniauth(auth_hash)
        expect(auth_user.last_name).to eq(last_name)
      end

    end

    describe '.find_by_emplid' do
      it 'should find a user by emplid' do
        auth_user = User.find_by_emplid(emplid: user.emplid)
        expect(auth_user.first_name).to eq('Brutus')
      end
    end

    describe '.find_by_name_n' do
      it 'should find a user by name_n' do
        auth_user = User.find_by_name_n(name_n: user.name_n)
        expect(auth_user.first_name).to eq('Brutus')
      end
    end

  end

end
