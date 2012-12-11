# Twitter::Bootstrap::Calendar
!(https://github.com/davidray/twitter-bootstrap-calendar/calendarsample.png)


I recently upgraded TroopTrack from Twitter Bootstrap 1 to 2, redesigning a few key aspects of the site to make it more usable. Overall, I was very pleased with the results except for one area – the calendar. I was using a calendar gem that provided a view helper that generates a table based calendar. It’s worked okay in the past, but now that I had managed to get every other aspect of my site scaling nicely for display on tablets, the horizontal scrolling caused by the rigid table layout was more than I could bear.

What I really needed was a table-less calendar that uses the bootstrap grid. The problem is, a 12-grid layout isn’t very good for creating a calendar, unless I manage to convince the universe to have either six or twelve days in a week. A quick call to my senator to that option off the table, so I decided to create a 7 column grid.

This is totally easy with Bootstrap’s form for downloading a customized CSS. I tweaked things a bit to get rid of the gutters, turned off pretty much everything except the grid bits, then wrapped the resulting CSS in a selector so it would only apply to my calendar div.

That was the easy part.

Next I needed a helper I could use to create my calendar. Fortunately, Ryan Bates had revised his screencast (#213) on how to create a calendar back in August and I was lucky enough to remember watching it. I swiped his calendar helper code and was off to the races.

I’m pretty happy with the end result – a 100% table free calendar layout that is uber-responsive and looks great on my iPad Mini (which I love!).

## Installation

Add this line to your application's Gemfile:

    gem 'twitter-bootstrap-calendar'

Add this line to your application.css:
  
    *= require twitter-bootstrap-calendar

And this line to your application.js:

    //= require twitter-bootstrap-calendar

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
