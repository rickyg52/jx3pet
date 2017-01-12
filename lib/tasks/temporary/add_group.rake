namespace :temporary do
  desc 'add new groups'

  task add_group: :environment do
    server_name = '引仙水榭'
    groups_num = [566311330, 494248434, 179081142]

    # add new group
    target_server = Server.find_by_name(server_name)
    groups_num.each { |g|
      Servers::Group.create(group_num: g, server: target_server, report_format:'cx {alias} {time}', mark: 'cx')
    } if target_server

    pets = [
      {'event': '破晓鸡', 'alias': '寇岛鸡'},
      {'event': '至尊宝', 'alias': '黑猫'},
      {'event': '破晓鸡', 'alias': '寇岛鸡'},
      {'event': '沙海谣', 'alias': '刀豆'},
      {'event': '至尊宝', 'alias': '黑猫'},
      {'event': '枫林酒', 'alias': '枫林客'},
      {'event': '归乡路', 'alias': '童心客'},
      {'event': '稚子心', 'alias': '甜豆'},
      {'event': '孩童书', 'alias': '一杠'},
      {'event': '红衣歌', 'alias': '红绸'},
      {'event': '青草歌', 'alias': '火狐狸'},
      {'event': '荆轲刺', 'alias': '黑刺客'},
      {'event': '滇南行', 'alias': '苗疆客'},
      {'event': '胜负局', 'alias': '胜负蟹'},
      {'event': '清茗经', 'alias': '清茗小龟'},
      {'event': '红羽大将军', 'alias': '大公鸡'},
    ]
    pets.each do |pet|
      p = Pet.find_by_name(pet[:event])
      Pets::PetAlias.find_or_create_by(alias: pet[:alias], pet: p, server: target_server)
    end
  end

end
