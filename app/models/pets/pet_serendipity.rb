module Pets
	class PetSerendipity < ActiveRecord::Base
		belongs_to :pet_alias, class_name: Pets::PetAlias

		validates_presence_of :pet_alias, :reporter, :trigger_time
	end
end