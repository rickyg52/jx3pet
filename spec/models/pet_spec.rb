require 'rails_helper'

describe Pet, type: :model do
	subject(:pet) 		{ create(:pet) }

	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:min_cd) }
	it { is_expected.to validate_presence_of(:max_cd) }

	it { is_expected.to have_many(:pet_aliases) }

	it 'should be valid' do
		expect(pet).to be_valid
	end
end