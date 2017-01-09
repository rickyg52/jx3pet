FactoryGirl.define do
  factory :serendipity do
    sequence(:name) { |n| "Serendipity - #{n}" }
    cd	10
  end
end
