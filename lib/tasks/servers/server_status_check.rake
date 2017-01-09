namespace :servers do
  desc 'server status check'

  task server_status_check: :environment do
    Server.all.each do |s|
      next if s.source_server
      result = ping(s.ip, s.port)
      next if s.status == result
      s.history = Time.now unless s.status
      s.status = result
      s.save
    end
  end

  def ping(ip, port)
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
