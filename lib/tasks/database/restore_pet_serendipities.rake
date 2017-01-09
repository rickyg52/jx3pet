namespace :database do
  desc 'restore pet serendipities'

  task restore_pet_serendipities: :environment do
    file = File.read('12.24.json')
    data_hash = JSON.parse(file)
    data_hash['objects'][0]['rows'].each do |r|
      # r[1]: name r[2]: time r[3]: server
      s = Server.find_by_name(r[3])
      t = Time.at(r[2])
      pet_alias = Pets::PetAlias.find_by_alias(r[1])
      if pet_alias
        p = pet_alias.pet
      else
        p = Pet.find_by_name(r[1])
      end
      if s && t && p
        Pets::PetSerendipity.create(trigger_time: t, pet: p, server: s)
      else
        puts "restore failed: #{r}"
      end
    end
  end
end
