require 'rails_helper'

describe Pets::PetSerendipity, type: :model do
	subject(:pet_serendipity) 		{ create(:pet_serendipity) }

	it { is_expected.to validate_presence_of(:pet_alias) }
	it { is_expected.to validate_presence_of(:reporter) }
	it { is_expected.to validate_presence_of(:trigger_time) }

	it 'should be valid' do
		expect(pet_serendipity).to be_valid
	end
end