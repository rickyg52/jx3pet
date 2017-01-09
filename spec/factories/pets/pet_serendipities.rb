FactoryGirl.define do
  factory :pet_serendipity, class: Pets::PetSerendipity do
    sequence(:reporter) { |n| n }
    association :pet_alias, factory: :pet_alias
    trigger_time Date.today
  end
end
