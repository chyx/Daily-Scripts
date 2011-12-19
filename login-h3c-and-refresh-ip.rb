require 'rubygems'
require 'open3'
#require 'pty'
#require 'expect'

Open3.popen2 ("h3client.exe") do |stdin, stdout|
	while ch = stdout.getc
		$stderr.putc ch
		break if ch == ":"
	end
	$stderr.putc stdout.getc
	stdin.print "4\r\n"
	$stderr.puts 'adapter choosed'
	sleep 20.seconds
	pid = Process.spawn("ipconfig /renew") 
	Process.wait pid
	while ch = stdout.getc
		$stderr.putc ch
	end

end 
