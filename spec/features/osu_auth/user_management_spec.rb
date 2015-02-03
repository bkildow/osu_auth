require 'rails_helper'
require 'support/spec_login_helper'

feature 'User management' do

  before(:each) { @role = create(:osu_auth_role) }
  before(:each) { @user = create(:osu_auth_user) }

  scenario 'User can create a new user' do

    set_permissions(@user, %w(add_user view_users))
    login(@user)
    visit '/admin/users/new'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'smith.1@osu.edu'
    fill_in 'Name.#', with: 'smith.1'
    check @role.name
    click_button 'Create User'

    expect(page).to have_text('User was successfully created.')
  end

  scenario 'User can edit a user' do

    set_permissions(@user, %w(edit_user view_users))
    login(@user)
    visit '/admin/users'
    click_link 'Edit'

    fill_in 'First Name', with: 'Bob'
    check @role.name
    click_button 'Update User'

    expect(page).to have_text('User was successfully updated.')
  end

  scenario 'User with no edit permissions cannot see edit link' do
    set_permissions(@user, %w(view_users))
    login(@user)
    visit '/admin/users'
    expect(page).to_not have_text('Edit')
  end
end
