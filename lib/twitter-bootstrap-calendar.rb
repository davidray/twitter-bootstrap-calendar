module Twitter
  module Bootstrap
      module Calendar
        require 'twitter/bootstrap/calendar/engine' if defined?(Rails)
      end
   end
end

require 'twitter/bootstrap/calendar/bootstrap' if defined?(Rails)
