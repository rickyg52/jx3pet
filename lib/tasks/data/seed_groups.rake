namespace :data do
	desc 'seed groups' 
	
	task seed_groups: :environment do
		groups = [
					{ "serverName": "战无不胜", "groupNum": "600715991" },
					{ "serverName": "战无不胜", "groupNum": "191109666" },
					{ "serverName": "战无不胜", "groupNum": "552914430" },
					{ "serverName": "战无不胜", "groupNum": "375092502" },
					{ "serverName": "平步青云", "groupNum": "556757444" },
					{ "serverName": "梦江南", "groupNum": "559789477" }
				]
		groups.each do |g| 
			s = Server.find_by_name(g[:serverName])
			group = Servers::Group.new(group_num: g[:groupNum])
			if s
				group.server = s 
				group.save
			end
		end
	end
end