module SSLScan

    class Evaluation

        def initialize(cipher: String, protocol : Symbol)
            @cipher = cipher
            @protocol = protocol
            @evaluated = Hash(Symbol, (String | Colorize::Object(String))).new
            @evaluated[:cipher] = SSLScan::RFC_NAMES[cipher]
            @evaluated[:protocol] = protocol.to_s
        end

        def evaluate
            @evaluted[:strenger] = cipher_string
        end
        

        def issue
            issues = [] of String | Colorize::Object(String)
            issues << "FREAK - CVE-2015-0204".colorize(:red) if @cipher =~ /EXP/i
            issues << "Bar Mitzvha Attack - CVE-2015-2808".colorize(:red) if @cipher =~ /RC4/i
            issues << "POODLE - CVE-2014-3566".colorize(:red) if @cipher =~ /CBC/i && @protocol == :ssl3
            issues << "POODLE - CVE-2014-8730".colorize(:red) if @cipher =~ /CBC/i && @protocol == :tls1
      
            issues.join(", ")
        end
    end
end
