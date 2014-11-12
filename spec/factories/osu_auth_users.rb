# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_user, :class => 'OsuAuth::User' do
    name_n 'buckeye.1'
    emplid '111111111'
    first_name 'Brutus'
    last_name 'Buckeye'
    email 'buckeye.1@osu.edu'
  end
end
