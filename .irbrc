begin
  require 'hirb'
  extend Hirb::Console
  Hirb.config[:width] = `tput cols`.to_i
rescue => e
  puts "Hirb could not be initialized. Install it using 'gem install hirb'"
  puts "The error was: #{e}"
end
