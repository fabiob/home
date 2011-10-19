begin
  require 'hirb'
  extend Hirb::Console if defined? Hirb
rescue Exception => e
  puts "Unable to load hirb"
end
