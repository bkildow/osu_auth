# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_user, :class => 'OsuAuth::User' do
    sequence(:name_n) { |n| "buckeye.#{n}" }
    emplid '111111111'
    first_name 'Brutus'
    last_name 'Buckeye'
    email 'buckeye.1@osu.edu'
    super_admin false
  end
end
