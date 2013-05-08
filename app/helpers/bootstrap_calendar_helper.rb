module BootstrapCalendarHelper
  def bootstrap_calendar(date = Date.today, options={}, &block)
    Twitter::Bootstrap::Calendar::BootstrapCalendar.new(self, date, options, block).calendar_div
  end
end
