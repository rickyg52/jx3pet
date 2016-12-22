FactoryGirl.define do
	factory :group do
		sequence(:group_num) { |n| n }
		association :server, factory: :server
	end
end