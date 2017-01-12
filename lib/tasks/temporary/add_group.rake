namespace :temporary do
  desc 'add new groups'

  task add_group: :environment do
    server_name = '绝代天骄'
    groups_num = [337593608]

    # add new group
    target_server = Server.find_by_name(server_name)
    groups_num.each { |g|
      Servers::Group.create(group_num: g, server: target_server, report_format:'CX{alias}{time}', mark: 'CX')
    } if target_server

    pets = [
      {'event': '破晓鸡', 'alias': '黄鸡'},
      {'event': '至尊宝', 'alias': '黑猫'},
      {'event': '沙海谣', 'alias': '刀豆'},
      {'event': '至尊宝', 'alias': '黑猫'},
      {'event': '枫林酒', 'alias': '枫客'},
      {'event': '归乡路', 'alias': '童心'},
      {'event': '稚子心', 'alias': '甜豆'},
      {'event': '孩童书', 'alias': '一杠'},
      {'event': '红衣歌', 'alias': '红绸'},
      {'event': '青草歌', 'alias': '火璃'},
      {'event': '青草歌', 'alias': '火狐'},
      {'event': '荆轲刺', 'alias': '刺客'},
      {'event': '荆轲刺', 'alias': '黑鸡'},
      {'event': '滇南行', 'alias': '苗疆'},
      {'event': '滇南行', 'alias': '苗客'},
      {'event': '竹马情', 'alias': '棋盘'},
      {'event': '竹马情', 'alias': '蓝龟'},
      {'event': '胜负局', 'alias': '胜负'},
      {'event': '捉妖记', 'alias': '酒客'},
      {'event': '清茗经', 'alias': '清茗'},
      {'event': '商周客', 'alias': '商客'},
      {'event': '红羽大将军', 'alias': '公鸡'},
    ]
    pets.each do |pet|
      p = Pet.find_by_name(pet[:event])
      Pets::PetAlias.find_or_create_by(alias: pet[:alias], pet: p, server: target_server)
    end
  end

end
