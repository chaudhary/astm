#!/usr/bin/ruby

require 'socket'
require_relative './../astm_parser.rb'
# require 'astm' # Assuming there’s a gem or you’ve written your own parser

PORT = 12345 # Replace with the desired port number

server = TCPServer.new(PORT)
puts "Listening on port #{PORT}..."

loop do
  Thread.start(server.accept) do |client|
    puts "Client connected"

    begin
      while message = client.gets
        # Process the ASTM message
        puts "Received: #{message}"

        # Parse the message if needed
        parsed_json, row_type = AstmParser.new(message).parse

        # # Handle the parsed ASTM message
        # puts "Parsed Message: #{astm_message.inspect}"

        # Respond if necessary
        client.puts parsed_json # Or appropriate response
      end
    rescue => e
      puts "Error: #{e.message}"
    ensure
      client.close
      puts "Client disconnected"
    end
  end
end
