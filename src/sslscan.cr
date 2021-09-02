require "colorize"
require "socket"
require "openssl"
require "./sslscan/*"


module SSLScan

    class Scan

        def initialize(ip: String, port: Int32)
            @ip = ip
            @port = port
        end

        def run
            sort_and_port(gather_results)
        end

        def ssl_handshake(cipher: Stirng, protocol : Array(OpenSSL::SSL::Options))
            begin
                s = socket
                c = OpenSSL::SSL::Context::Client.new
                c.ciphers = cipher
                c.verify_mode = OpenSSL::SSL::VerifyMode::None
                protocol.each do |options|
                    c.add_options(option)
                end
                OpenSSL::SSL::Socket::Client.new(s, c)
                s.close if s.is_a? TCPSocket rescue nil
                true
            rescue
                s.close if s.is_a? TCPSocket rescue nil
                false
            end
        end
    end
end
