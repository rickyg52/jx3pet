namespace :data do
	desc 'seed all pets' 
	
	task seed_pets: :environment do
		pets = [
					{ "event": "捉妖记", "coolDown": 5, "Maximum":7,"alias": "酒客" },
					{ "event": "石敢当", "coolDown": 10, "Maximum":12 },
					{ "event": "至尊宝", "coolDown": 5, "Maximum":7,"alias": "黑猫" },
					{ "event": "孩童书", "coolDown": 5, "Maximum":8,"alias": "一杠" },
					{ "event": "稚子心", "coolDown": 5, "Maximum":7,"alias": "甜豆" },
					{ "event": "红衣歌", "coolDown": 5, "Maximum":7,"alias": "红绸" },
					{ "event": "归乡路", "coolDown": 5, "Maximum":7,"alias": "童心客" },
					{ "event": "荆轲刺", "coolDown": 5, "Maximum":7,"alias": "荆轲刺" },
					{ "event": "沙海谣", "coolDown": 5, "Maximum":7,"alias": "刀豆" },
					{ "event": "枫林酒", "coolDown": 5, "Maximum":7,"alias": "枫林客" },
					{ "event": "青草歌", "coolDown": 5, "Maximum":7,"alias": "狐狸" },
					{ "event": "滇南行", "coolDown": 5, "Maximum":7,"alias": "羊头" },
					{ "event": "竹马情", "coolDown": 5, "Maximum":7,"alias": "蓝龟" },
					{ "event": "胜负局", "coolDown": 5, "Maximum":7,"alias": "胜负" },
					{ "event": "破晓鸡", "coolDown": 5, "Maximum":7,"alias": "黄鸡" },
					{ "event": "清茗经", "coolDown": 3, "Maximum":5,"alias": "绿龟" },
					{ "event": "果果", "coolDown": 9, "Maximum":10 },
					{ "event": "小诺", "coolDown": 9, "Maximum":10 },
					{ "event": "静静", "coolDown": 8, "Maximum":9 },
					{ "event": "商周客", "coolDown": 6, "Maximum":7 },
					{ "event": "花客", "coolDown": 6, "Maximum":7 },
					{ "event": "红羽大将军", "coolDown": 6, "Maximum":7,"alias": "公鸡" },
					{ "event": "嘟嘟", "coolDown": 6, "Maximum":7 }
				]
		pets.each do |pet| 
			p = Pet.find_or_create_by(name: pet[:event], min_cd: pet[:coolDown], max_cd: pet[:Maximum])
			if pet[:alias] 
				Servers::Group.all.each do |group|
					Pets::PetAlias.find_or_create_by(alias: pet[:alias], pet: p, server: group.server)
				end
			end
		end
	end
end