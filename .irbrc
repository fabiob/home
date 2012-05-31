begin
  require 'rubygems'
  require 'hirb'
  extend Hirb::Console
  Hirb.config[:width] = 170
rescue => e
  puts "Hirb could not be initialized. Install it using 'gem install hirb'"
  puts "The error was: #{e}"
end
if defined? AuditLogger
  AuditLogger.set_as_default_logger if AuditLogger.respond_to? :set_as_default_logger
  AuditLogger.init_stdout Logger::DEBUG if AuditLogger.respond_to? :init_stdout
end
