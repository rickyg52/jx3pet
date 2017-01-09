module Concerns
	module Ping
		def ping(server)
			begin
				Timeout.timeout(5) do
					s = TCPSocket.new(server.ip, server.port)
					s.close
					return true
				end
			rescue Errno::ECONNREFUSED
				return true
			rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
				return false
			end
		end
	end
end
