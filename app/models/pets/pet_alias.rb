module Pets
	class PetAlias < ActiveRecord::Base
		belongs_to :pet
		belongs_to :server
		has_many :pet_serendipities, class_name: Pets::PetSerendipity
		validates_presence_of :pet, :server
	end
end