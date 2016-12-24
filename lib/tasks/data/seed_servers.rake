
namespace :data do
	desc 'seed all servers' 
	# 0:区 1:服 3:ip 4:port 10: root server 11:root server regions
	task seed_servers: :environment do
		IO.foreach('serverlist.ini') do |line|
			server_info = line.split(' ')
			server = Server.new(name: server_info[1], region: server_info[0], ip: server_info[3], port: server_info[4])
			# if the current server is not root server, find root server
			server.source_server = Server.find_by_name(server_info[10]) unless (server_info[10].equal? server_info[1])  
			server.save
		end
	end
end