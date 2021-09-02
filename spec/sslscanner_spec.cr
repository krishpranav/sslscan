require "./spec_helper"

describe SSLScan do
  it "ciphers are array" do
    SSLScan.ciphers.is_a? Array
  end
  it "list all ciphers" do
    puts SSLScan.ciphers
  end
  it "scans google.com" do
    scanner = SSLScan::Scan.new("google.com", 443)
    scanner.run
  end
  it "scans facebook.com" do
    scanner = SSLScan::Scan.new("facebook.com", 443)
    scanner.run
  end
end