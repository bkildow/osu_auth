# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_role_membership, :class => 'OsuAuth::RoleMembership' do
    association :user, factory: :osu_auth_user
    association :role, factory: :osu_auth_role
  end
end
