begin
  require 'hirb'
  extend Hirb::Console
  Hirb.config[:width] = 170
rescue => e
  puts "Hirb could not be initialized. Install it using 'gem install hirb'"
  puts "The error was: #{e}"
end
