# Twitter::Bootstrap::Calendar

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'twitter-bootstrap-calendar'

Add this line to your application.css:
  
    *= require twitter-bootstrap-calendar

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter-bootstrap-calendar

## Usage

To create a calendar in your view, just call the helper method and pass in a block, like so:
```haml
  = bootstrap_calendar month do |date| 
    = link_to date.day, new_plan_event_path(:event => {:activity_at => date.beginning_of_day + 12.hours})
    - if @events_by_date[date] 
      ul.event_summary
        - @events_by_date[date].each do |event| 
          li style=event_style(event)
            = link_to "#{event.title}: #{event.activity_at.to_s(:time_only)}", menu_plan_event_path(event), :remote => true, :style => event_link_style(event)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
