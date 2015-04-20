require 'active_support/core_ext'
module Twitter
  module Bootstrap
    module Calendar
      class BootstrapCalendar
        DAY_NAMES = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
        MOBILE_DAY_NAMES = %w[Sun Mon Tues Wed Thur Fri Sat]
        START_DAY = :sunday

        attr_reader :view, :date, :callback, :options

        def content_tag *args, &block
          view.content_tag(*args, &block)
        end

        def initialize(view, date, options={}, callback)
          @view = view
          @date = date
          @options = options.symbolize_keys
          @callback = callback
        end

        def start_day
          @start_day ||= (options[:start_day] && DAY_NAMES.include?(options[:start_day].to_s.humanize)) ? options[:start_day].to_s.downcase.to_sym : :sunday
        end


        def calendar_div
          content_tag 'div', class: "calendar_grid" do
            header + week_rows
          end
        end

        def start_day_index
          @start_day_index ||= DAY_NAMES.index {|n| n.downcase == start_day.to_s} || 0
        end

        def day_names
          return DAY_NAMES if start_day_index.zero?
          DAY_NAMES[start_day_index, DAY_NAMES.size - start_day_index] + DAY_NAMES[0, start_day_index]
        end

        def mobile_day_names
          return MOBILE_DAY_NAMES if start_day_index.zero?
          MOBILE_DAY_NAMES[start_day_index, MOBILE_DAY_NAMES.size - start_day_index] + MOBILE_DAY_NAMES[0, start_day_index]
        end

        def header
          content_tag 'div', class: 'month_header row-fluid' do
            standard = day_names.map { |day|
              content_tag :div, class: 'span1 visible-desktop' do
                I18n.t(day.downcase)
              end
            }.join.html_safe
            mobile = mobile_day_names.map { |day|
              content_tag :div, class: 'span1 hidden-desktop', style: 'width: 14.1%' do
                I18n.t(day.downcase)
              end
            }.join.html_safe

            standard + mobile
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
          first = date.beginning_of_month.beginning_of_week(start_day)
          last = date.end_of_month.end_of_week(start_day)
          (first..last).to_a.in_groups_of(7)
        end
      end
    end
  end
end
