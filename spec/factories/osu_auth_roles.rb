# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_role, :class => 'OsuAuth::Role' do
    name 'Super Admin'
  end
end
