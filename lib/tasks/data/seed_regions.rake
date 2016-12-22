namespace :data do
	desc 'seed all regions' 
	
	task seed_regions: :environment do
		regions = [
					{ "event": "三尺青峰", "coolDown": 14 },
					{ "event": "三山四海", "coolDown": 14 },
					{ "event": "塞外宝驹", "coolDown": 14 },
					{ "event": "阴阳两界", "coolDown": 14 },
					{ "event": "虎啸山林", "coolDown": 7 },
					{ "event": "清风捕王", "coolDown": 7 },
					{ "event": "乱世舞姬", "coolDown": 7 },
					{ "event": "护佑苍生", "coolDown": 7 }
				]
		serendipities.each do |serendipity| 
			Serendipity.create(name: serendipity[:event], cd: serendipity[:coolDown])
		end
	end
end