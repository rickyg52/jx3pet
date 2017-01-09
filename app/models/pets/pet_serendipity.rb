module Pets
  class PetSerendipity < ActiveRecord::Base
    belongs_to :pet
    belongs_to :server

    validates_presence_of :pet, :server, :reporter, :trigger_time

    def in_cd?
      if pet.min_cd <= diff_between(Time.now)[:hour] && diff_between(Time.now)[:hour] <= pet.max_cd
        true
      elsif 2 * pet.min_cd <= diff_between(Time.now)[:hour] && diff_between(Time.now)[:hour] <= 2 * pet.max_cd
        true
      else
        false
      end
    end

    def diff_between(time)
      diff = time - trigger_time
      hours = (diff / 1.hour).floor
      minutes = ((diff % 1.hour) / 1.minute).round
      { hour: hours, minutes: minutes }
    end
  end
end
