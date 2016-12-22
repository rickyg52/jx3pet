class Serendipity < ActiveRecord::Base
	validates_presence_of :name, :cd
end