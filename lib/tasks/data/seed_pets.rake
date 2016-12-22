namespace :data do
	desc 'seed all pets' 
	
	task seed_pets: :environment do
		pets = [
					{ "event": "捉妖记", "coolDown": 5, "Maximum":7 },
					{ "event": "石敢当", "coolDown": 10, "Maximum":12 },
					{ "event": "至尊宝", "coolDown": 5, "Maximum":7 },
					{ "event": "孩童书", "coolDown": 5, "Maximum":8 },
					{ "event": "稚子心", "coolDown": 5, "Maximum":7 },
					{ "event": "红衣歌", "coolDown": 5, "Maximum":7 },
					{ "event": "归乡路", "coolDown": 5, "Maximum":7 },
					{ "event": "荆轲刺", "coolDown": 5, "Maximum":7 },
					{ "event": "沙海谣", "coolDown": 5, "Maximum":7 },
					{ "event": "枫林酒", "coolDown": 5, "Maximum":7 },
					{ "event": "青草歌", "coolDown": 5, "Maximum":7 },
					{ "event": "滇南行", "coolDown": 5, "Maximum":7 },
					{ "event": "竹马情", "coolDown": 5, "Maximum":7 },
					{ "event": "胜负局", "coolDown": 5, "Maximum":7 },
					{ "event": "破晓鸡", "coolDown": 5, "Maximum":7 },
					{ "event": "清茗经", "coolDown": 5, "Maximum":8 },
					{ "event": "果果", "coolDown": 9, "Maximum":10 },
					{ "event": "小诺", "coolDown": 9, "Maximum":10 },
					{ "event": "静静", "coolDown": 8, "Maximum":9 },
					{ "event": "商周客", "coolDown": 6, "Maximum":7 },
					{ "event": "花客", "coolDown": 6, "Maximum":7 },
					{ "event": "公鸡", "coolDown": 6, "Maximum":7 },
					{ "event": "嘟嘟", "coolDown": 6, "Maximum":7 }
				]
		pets.each do |pet| 
			Pet.create(name: pet[:event], min_cd: pet[:coolDown], max_cd: pet[:Maximum])
		end
	end
end