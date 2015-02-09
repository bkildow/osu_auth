# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_permission, :class => 'OsuAuth::Permission' do
    name 'edit_user'
    description 'can edit user'
  end
end
