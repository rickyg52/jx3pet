namespace :servers do
  desc 'server status check'

  task server_status_check: :environment do
    Server.all.each do |s|
      unless s.source_server
        result = ping(s.ip, s.port)
        unless s.status == result
          s.history = Time.now unless s.status
          s.status = result
          s.save
        end
      end
    end
  end

  def ping(ip, port)
    begin
      Timeout.timeout(1) do
        s = TCPSocket.new(ip, port)
        s.close
        return true
      end
    rescue Errno::ECONNREFUSED
      return false
    rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
      return false
    end
  end
end
