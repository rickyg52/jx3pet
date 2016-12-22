FactoryGirl.define do
	factory :pet_alias, class: Pets::PetAlias do
		sequence(:alias) { |n| "Pet aliase - #{n}" }
		association :pet, factory: :pet
		association :server, factory: :server

		trait :with_serendipities do
			pet_serendipitys { create_list :pet_serendipity, 5 }
		end
	end
end