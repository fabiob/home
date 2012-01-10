begin
  require 'rubygems'
  require 'hirb'
  extend Hirb::Console
  Hirb.config[:width] = 250
rescue => e
  puts "Hirb could not be initialized. Install it using 'gem install hirb'"
  puts "The error was: #{e}"
end
AuditLogger.set_as_default_logger if defined? AuditLogger
