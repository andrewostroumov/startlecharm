require 'xmlrpc/client'

# Client example
client = XMLRPC::Client.new 'localhost', '/', 8080
client.call 'system.memory'