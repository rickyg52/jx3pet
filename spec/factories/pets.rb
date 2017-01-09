FactoryGirl.define do
  factory :pet do
    sequence(:name) { |n| "Pet - #{n}" }
    min_cd	5
    max_cd	8

    trait :with_aliases do
      pet_aliases { create_list :pet_alias, 3 }
    end
  end
end
