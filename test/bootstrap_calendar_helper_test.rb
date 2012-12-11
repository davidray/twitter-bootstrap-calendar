require 'test_helper'
include Rails.application.routes.url_helpers

class BoostrapCalendarHelperTest < ActionView::TestCase
  test "should create a calendar" do
    calendar_html = bootstrap_calendar Date.new(2012,12,13) do |date|
      'Put stuff about events here'
    end
    assert_equal 'ooh', calendar_html
  end
end

