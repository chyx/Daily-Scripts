loop do
	pid = Process.spawn(ARGV[0])
	Process.wait(pid)
	break if $?.exitstatus == 0
end
