require "../src/sslscan"

puts "Usage: ./sslscan [host] [port]"
raise "not enough arguments given" if ARGV.size < 2
host = ARGV[0]
port = ARGV[1].to_i
scanner = SSLScan::Scan.new(host, port)
scanner.run