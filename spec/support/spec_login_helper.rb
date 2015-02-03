module SpecLoginHelper

  def login(user)
    visit 'auth/developer'
    fill_in 'name_n', with: user.name_n
    click_button 'Sign In'
  end

  def set_permissions(object, permissions)
    allow_any_instance_of(object.class).to receive(:permissions).and_return(permissions)
  end

end


RSpec.configure do |config|
  config.include SpecLoginHelper
end
