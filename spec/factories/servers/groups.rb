FactoryGirl.define do
  factory :group, class: Servers::Group do
    sequence(:group_num) { |n| n }
    association :server, factory: :server
  end
end
