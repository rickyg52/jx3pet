FactoryGirl.define do
  factory :server do
    sequence(:name) { |n| "Server - #{n}" }
    region 'test'

    trait :with_groups do
      groups { create_list :group, 3 }
    end
  end
end
