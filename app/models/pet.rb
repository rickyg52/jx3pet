class Pet < ActiveRecord::Base
	has_many :pet_aliases, class_name: Pets::PetAlias
	validates_presence_of :name, :min_cd, :max_cd
end