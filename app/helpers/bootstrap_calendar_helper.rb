module BootstrapCalendarHelper
  def bootstrap_calendar(date = Date.today, &block)
    BootstrapCalendar.new(self, date, block).calendar_div
  end

  BootstrapCalendar = Struct.new(:view, :date, :callback) do
    HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    START_DAY = :sunday

    delegate :content_tag, to: :view

    def calendar_div
      content_tag 'div', class: "calendar_grid" do
        header + week_rows
      end
    end

    def header
      content_tag 'div', class: 'month_header row-fluid' do
        HEADER.map { |day| content_tag :div, class: 'span1' do
          day
        end }.join.html_safe
      end
    end

    def week_rows
      weeks.map {|week|
        content_tag :div, class: 'row-fluid week' do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      }.join.html_safe
    end

    def day_cell(day)
      content_tag :div, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = ['span1']
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "month" if day.month == date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end