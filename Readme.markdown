# Lagunitas

Easy iOS IPAs inspection.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'lagunitas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lagunitas

## Usage

``` ruby
ipa = Lagunitas::IPA.new('path/to/Your.ipa')

# Unzip and create app
app = ipa.app     #=> Lagunitas::App

# Get information about the app
app.identifier    #=> com.samsoffes.Sample
app.display_name  #=> Sample
app.version       #=> 13
app.short_version #=> 2.2

# Get an icon path at a specific size
app.icon(40)      #=> '/absolute/path/to/Icon20x20@2x.png'

# You can also get all of the icons with their dimensions
app.icons         #=> [{path:'...', width: 40, height: 40}, ...]

# Remove unzipped app
ipa.cleanup
```

It's worth noting that if you get a path to an image in the bundle, it will be crushed with Apple's special PNGCrush. I have a gem to convert them called [pngdefry](https://github.com/soffes/pngdefry). Lagunitas depends on this already to get sizes for the icons. If you want to get a useable PNG out, do something like this:

``` ruby
icon_path = app.icon(40)
Pngdefry.defry(iconpath, "output.png")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
