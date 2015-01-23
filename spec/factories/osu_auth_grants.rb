# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_grant, :class => 'OsuAuth::Grant' do
    association :role, factory: :osu_auth_role
    permission 'edit_user'
  end
end
