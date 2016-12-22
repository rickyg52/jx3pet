require 'rails_helper'

describe Serendipity, type: :model do
	subject(:serendipity) 		{ create(:serendipity) }

	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:cd) }

	it 'should be valid' do
		expect(serendipity).to be_valid
	end
end