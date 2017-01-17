namespace :temporary do
  desc 'add new groups'

  task add_group: :environment do
    server_name = '幽月轮'
    groups_num = [240580944]

    # add new group
    target_server = Server.find_by_name(server_name)
    groups_num.each { |g|
      Servers::Group.create(group_num: g, server: target_server, report_format:'fm{alias}{time}', mark: 'FM')
    } if target_server

    pets = [
      {'event': '破晓鸡', 'alias': '破晓鸡'},
      {'event': '至尊宝', 'alias': '黑猫'},
      {'event': '沙海谣', 'alias': '刀豆'},
      {'event': '枫林酒', 'alias': '枫林客'},
      {'event': '归乡路', 'alias': '童心客'},
      {'event': '稚子心', 'alias': '甜豆'},
      {'event': '孩童书', 'alias': '一杠'},
      {'event': '红衣歌', 'alias': '红绸'},
      {'event': '青草歌', 'alias': '火狐'},
      {'event': '荆轲刺', 'alias': '黑鸡'},
      {'event': '滇南行', 'alias': '苗疆客'},
      {'event': '竹马情', 'alias': '蓝龟'},
      {'event': '胜负局', 'alias': '胜负'},
      {'event': '捉妖记', 'alias': '酒客'},
      {'event': '清茗经', 'alias': '清茗龟'},
      {'event': '石敢当', 'alias': '当当'},
      {'event': '红羽大将军', 'alias': '红羽大公鸡'},
    ]
    pets.each do |pet|
      p = Pet.find_by_name(pet[:event])
      Pets::PetAlias.find_or_create_by(alias: pet[:alias], pet: p, server: target_server)
    end
  end

end
