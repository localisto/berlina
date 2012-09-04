# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    organization
    external_id { Time.now.to_i }
    start_time { Date.today }
  end
end
