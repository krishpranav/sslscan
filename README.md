# sslscan
A SSL Scanner Written In Crystal-Lang

# Installation:
```
$ git clone https://github.com/krishpranav/sslscan
$ cd sslscan
$ make
```

## Usage:
```
./sslscan google.com 443
```

## More Examples:
```crystal
# import the ssl scan crystal library
require "sslscan"

# code to scan the target website 
scanner = SSLScan::Scan.new("google.com", 443)

# runs the program
scanner.run
```
