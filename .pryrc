begin
  require 'hirb'
  extend Hirb::Console
  Hirb.config[:width] = `tput cols`.to_i
rescue LoadError
  # Missing goodies, bummer
end
