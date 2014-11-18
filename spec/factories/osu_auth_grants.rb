# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osu_auth_grant, :class => 'Grant' do
    role_id 1
    machine_name "MyString"
  end
end
