# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_permission, :class => 'OsuAuth::Permission' do
    machine_name 'edit_user'
    association :role, factory: :osu_auth_role
  end
end