require 'rails_helper'
require 'support/spec_login_helper'

feature 'Role management' do

  before(:each) { @user = create(:osu_auth_user) }

  scenario 'User can create a new role' do

    set_permissions(@user, %w(add_role view_roles))
    login(@user)
    visit '/admin/roles/new'

    fill_in 'Name', with: 'Admin'
    check 'can add users'
    click_button 'Create Role'

    expect(page).to have_text('Role was successfully created.')
  end

  scenario 'User can edit a role' do
    role = create(:osu_auth_role)
    set_permissions(@user, %w(edit_role view_roles))
    login(@user)
    visit '/admin/roles'
    click_link 'Edit'

    fill_in 'Name', with: 'Administrator'
    check 'can add users'
    click_button 'Update Role'

    expect(page).to have_text('Role was successfully updated.')
  end

  scenario 'User with no edit permissions cannot see edit link' do
    set_permissions(@user, %w(view_roles))
    login(@user)
    visit '/admin/roles'
    expect(page).to_not have_text('Edit')
  end
end
