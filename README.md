# AdminLTE 2 Rails Gem

[AdminLTE](https://github.com/almasaeed2010/AdminLTE) is a premium Bootstrap theme for backend.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'adminlte2-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adminlte2-rails


Then, generate the default template:

    $ bin/rails generate admin_lte2

# Plugins

## Add a new plugins

By default, there's no plugin installed. However, I've created a generator to help you install them

    $ rails g admin_lte2_plugins PLUGIN_NAME

# Plugins available

  - [jVectorMap](https://github.com/bjornd/jvectormap) (j_vector_map)
  - [ChartJS](https://github.com/nnnick/Chart.js/) (chart_js)
  - [Sparkline](https://github.com/gwatts/jquery.sparkline) (sparkline)
  - [Bootstrap Slider](https://github.com/seiyria/bootstrap-slider) (bootstrap_slider)
  - [Bootstrap WYSIHTML5](https://github.com/jhollingworth/bootstrap-wysihtml5/) (bootstrap_wysihtml5)
  - [Full Calendar](https://github.com/arshaw/fullcalendar) (fullcalendar)
  - [Knob](https://github.com/aterrien/jQuery-Knob) (knob)
  - [TimePicker](https://github.com/jdewit/bootstrap-timepicker) (timepicker)
  - [Pace](https://github.com/HubSpot/pace) (pace)
  - [MorrisJS](https://github.com/morrisjs/morris.js/) (morris)
  - [Date Range Picker](https://github.com/dangrossman/bootstrap-daterangepicker) (daterangepicker)
  - [Color Picker](https://github.com/mjolnic/bootstrap-colorpicker/) (colorpicker)
  - [Date Picker](https://github.com/eternicode/bootstrap-datepicker) (datepicker)
  - [slimScroll](https://github.com/rochal/jQuery-slimScroll) (slimScroll)
  - [iCheck](https://github.com/fronteed/iCheck) (icheck)
  - [Toastr](https://github.com/CodeSeven/toastr) (toastr)

# Plugins missing

* [ ] ckeditor
* [ ] datatables
* [ ] fastclick
* [ ] flot
* [ ] input-mask
* [ ] ionslider

## Contributing

1. Fork it ( https://github.com/nicolas-besnard/adminlte2-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
