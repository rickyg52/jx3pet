module PingHelper
  def ping(ip, port)
    begin
      Timeout.timeout(5) do
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
