
namespace :data do
	desc 'seed all regions' 
	
	task seed_regions: :environment do
		IO.foreach('serverlist.ini') do |line|
			byebug
		end
	end
end