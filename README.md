# Twitter::Bootstrap::Calendar
![ScreenShot](https://raw.github.com/davidray/twitter-bootstrap-calendar/master/calendarsample.png)

I recently upgraded TroopTrack from Twitter Bootstrap 1 to 2, redesigning a few key aspects of the site to make it more usable. Overall, I was very pleased with the results except for one area – the calendar. I was using a calendar gem that provided a view helper that generates a table based calendar. It worked okay in the past, but now that I had managed to get every other aspect of my site scaling nicely for display on tablets, the horizontal scrolling caused by the rigid table layout was more than I could bear.

What I really needed was a table-less calendar that uses the bootstrap grid. The problem is, a 12-grid layout isn’t very good for creating a calendar, unless I manage to convince the universe to have either six or twelve days in a week. A quick call to my senator took that option off the table, so I decided to create a 7 column grid using bootstrap's options for customization. 

This gem is the result.

Hat Tip to Ryan Bates for Railscast #213, from which I lifted the approach to the calendar helper method.

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

Note - you can pass any sort of block you want into the helper. If you use a block like mine, you will need to group the events by date, like so:

```ruby
  @events_by_date = @all_events.group_by(&:activity_on)
```

But really you can do anything you want in there. There are no required models or methods - the gem will pass the date of each day on the calendar into the block and you just need to be able to generate html for the contents based on the date.

```haml
  = bootstrap_calendar month do |date| 
    / Do whatever you want here!
```

Here's a sample app if you need to see this in action, thanks to Jeff Lunt.
  https://github.com/normalocity/tbc-heroku
  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
