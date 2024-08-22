require 'socket'

# Define the server address and port
server_address = '127.0.0.1' # Replace with the server's IP address
server_port = 12345 # Replace with the server's port

# Create a TCP socket
socket = TCPSocket.new(server_address, server_port)

message = "H|\^&|||LabCorp^1234^123 Street^City^ST^ZIP||^Instrument^1^||P|1
P|1| |PatId123| |Doe^John^R^Jr.^Dr.| |19651029|M| |2 Main St.^Baltimore^ MD^21211^USA| |(410) 316 - 4000|JSMITH| | || |PNEU|P\AM\AMX| | | |19981015120000| |324| | | | | | |ER|St.Josephs Hospital
O|1|456789^LabOrder|||^^^TESTCODE^Test Name|R||20230822080000|20230822080000||||||||||1^Doctor^First^M^^MD|||||D|||||||||
R|1|^^^TESTCODE^Test Name|Positive|N|||F|||20230822090000|||||||
L|1|N"

socket.puts message

# Receive and print the response from the server
response = socket.gets
puts "Response from server: #{response}"

response = socket.gets
puts "Response from server: #{response}"

response = socket.gets
puts "Response from server: #{response}"

response = socket.gets
puts "Response from server: #{response}"

response = socket.gets
puts "Response from server: #{response}"

# Close the socket
socket.close
