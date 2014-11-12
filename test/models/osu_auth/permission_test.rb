require 'test_helper'

module OsuAuth
  class PermissionTest < ActiveSupport::TestCase

    test 'permissions should be merged' do
      OsuAuth::Permission.config do
        {perm1: 'permission one'}
      end

      assert_equal OsuAuth::Permission.permissions, {perm1: 'permission one', edit_user: 'can edit users'}
    end
  end
end
