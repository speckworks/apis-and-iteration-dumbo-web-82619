#!/usr/bin/env ruby
# require "pry"
# require "rest-client"
# require ""

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character_name = get_character_from_user
print_movies(get_character_movies_from_api(character_name))
