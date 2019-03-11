# PlantumlBuilder

[![Gem Version](https://badge.fury.io/rb/plantuml_builder.svg)](https://badge.fury.io/rb/plantuml_builder)
[![Build Status](https://travis-ci.com/svernidub/plantuml_builder.svg?branch=master)](https://travis-ci.com/svernidub/plantuml_builder)

Gem to convet [PlantUML](http://plantuml.com) diagrams using plantuml.com or
[local](https://hub.docker.com/r/plantuml/plantuml-server/) PlantUML server

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plantuml_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plantuml_builder

## Usage

PlantUML allows to describe UML (and some other) diagrams in it's own text format.

For example, [sequence diagram](http://plantuml.com/sequence-diagram):
```wsd
@startuml
  actor User
  
  User -> MyService : perform
  activate MyService
    return true
  deactivate MyService
@enduml
```

The diagram above will be rendered to:

![](http://www.plantuml.com/plantuml/png/UDfJK70eBaaiAYdDpU5I08B4v9By8eNGujGYC1S8G6m5NJi5tyhWrAAopEHK1Ik5WjIYjFoYN9YEpBB4abI40gZEejIIqg8yXPAYKeX8IYfMfGwfUIaWsm5R-2hl)

PlantUML web service expects compression of such diagrams into
it's own format. The diagram above should be converted to

```
UDfJK70eBaaiAYdDpU5I08B4v9By8eNGujGYC1S8G6m5NJi5tyhWrAAopEHK1Ik5WjIYjFoYN9YEpBB4abI40gZEejIIqg8yXPAYKeX8IYfMfGwfUIaWsm5R-2hl
```

Using `plantuml_builder` you can fetch rendered diagrams from specified server.

Diagrams could be fetched as SVG, PNG, and TXT (ASCII-art) format.


### Using as standalone app

To build one diagram in SVG format from plantuml.com run:

```bash
$ plantuml_build png source_file.wsd destination_file.svg
```

If you need build whole directory, specify `-R` flag before source. To build it into PNG diagrams:

```bash
$ plantuml_build png -R src dest
```

If you want to use local server as endpoint, specify it with `--endpoint`:

```bash
$ plantuml_build txt source_file.wsd destination_file.txt --endpoint=http://localhost:8080
```

### Using as library

First, receive diagram text (from WSD or other file format).

```ruby
wsd = <<-WSD
    @startuml
      actor User
      
      User -> MyService : perform
      activate MyService
        return true
      deactivate MyService
    @enduml
WSD
```

#### SVG

Fetch diagram as SVG:

```ruby
PlantumlBuilder::Formats::SVG.new(wsd).load
=> "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" contentScriptType=\"application/ecmascript\" contentStyleType=\"text/css\" height=\"251px\" preserveAspectRatio=\"none\" style=\"width:152px;height:251px;\" version=\"1.1\" viewBox=\"0 0 152 251\" width=\"152px\" zoomAndPan=\"magnify\">\n<defs>\n<filter height=\"300%\" id=\"fz1m93rvif4fb\" width=\"300%\" x=\"-1\" y=\"-1\">\n<feGaussianBlur result=\"blurOut\" stdDeviation=\"2.0\"/>\n<feColorMatrix in=\"blurOut\" result=\"blurOut2\" type=\"matrix\" values=\"0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .4 0\"/>\n<feOffset dx=\"4.0\" dy=\"4.0\" in=\"blurOut2\" result=\"blurOut3\"/>\n<feBlend in=\"SourceGraphic\" in2=\"blurOut3\" mode=\"normal\"/>\n</filter>\n</defs>\n<g>\n<rect fill=\"#FFFFFF\" filter=\"url(#fz1m93rvif4fb)\" height=\"29.1328\" style=\"stroke: #A80036; stroke-width: 1.0;\" width=\"10\" x=\"97\" y=\"117.4297\"/>\n<line style=\"stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 5.0,5.0;\" x1=\"27\" x2=\"27\" y1=\"86.2969\" y2=\"164.5625\"/>\n<line style=\"stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 5.0,5.0;\" x1=\"101.5\" x2=\"101.5\" y1=\"86.2969\" y2=\"164.5625\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"14\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"32\" x=\"8\" y=\"82.9951\">\nUser</text>\n<ellipse cx=\"27\" cy=\"13\" fill=\"#FEFECE\" filter=\"url(#fz1m93rvif4fb)\" rx=\"8\" ry=\"8\" style=\"stroke: #A80036; stroke-width: 2.0;\"/>\n<path d=\"M27,21 L27,48 M14,29 L40,29 M27,48 L14,63 M27,48 L40,63 \" fill=\"none\" filter=\"url(#fz1m93rvif4fb)\" style=\"stroke: #A80036; stroke-width: 2.0;\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"14\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"32\" x=\"8\" y=\"176.5576\">\nUser</text>\n<ellipse cx=\"27\" cy=\"189.8594\" fill=\"#FEFECE\" filter=\"url(#fz1m93rvif4fb)\" rx=\"8\" ry=\"8\" style=\"stroke: #A80036; stroke-width: 2.0;\"/>\n<path d=\"M27,197.8594 L27,224.8594 M14,205.8594 L40,205.8594 M27,224.8594 L14,239.8594 M27,224.8594 L40,239.8594 \" fill=\"none\" filter=\"url(#fz1m93rvif4fb)\" style=\"stroke: #A80036; stroke-width: 2.0;\"/>\n<rect fill=\"#FEFECE\" filter=\"url(#fz1m93rvif4fb)\" height=\"30.2969\" style=\"stroke: #A80036; stroke-width: 1.5;\" width=\"83\" x=\"58.5\" y=\"51\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"14\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"69\" x=\"65.5\" y=\"70.9951\">\nMyService</text>\n<rect fill=\"#FEFECE\" filter=\"url(#fz1m93rvif4fb)\" height=\"30.2969\" style=\"stroke: #A80036; stroke-width: 1.5;\" width=\"83\" x=\"58.5\" y=\"163.5625\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"14\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"69\" x=\"65.5\" y=\"183.5576\">\nMyService</text>\n<rect fill=\"#FFFFFF\" filter=\"url(#fz1m93rvif4fb)\" height=\"29.1328\" style=\"stroke: #A80036; stroke-width: 1.0;\" width=\"10\" x=\"97\" y=\"117.4297\"/>\n<polygon fill=\"#A80036\" points=\"85,113.4297,95,117.4297,85,121.4297,89,117.4297\" style=\"stroke: #A80036; stroke-width: 1.0;\"/>\n<line style=\"stroke: #A80036; stroke-width: 1.0;\" x1=\"27\" x2=\"91\" y1=\"117.4297\" y2=\"117.4297\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"13\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"51\" x=\"34\" y=\"112.3638\">\nperform</text>\n<polygon fill=\"#A80036\" points=\"38,142.5625,28,146.5625,38,150.5625,34,146.5625\" style=\"stroke: #A80036; stroke-width: 1.0;\"/>\n<line style=\"stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 2.0,2.0;\" x1=\"32\" x2=\"101\" y1=\"146.5625\" y2=\"146.5625\"/>\n<text fill=\"#000000\" font-family=\"sans-serif\" font-size=\"13\" lengthAdjust=\"spacingAndGlyphs\" textLength=\"26\" x=\"44\" y=\"141.4966\">\ntrue</text>\n\n</g>\n</svg"
```

PlantUML renders SVG as single line of XML code. It is not comfortable because it is impossible
to store it in version control system. So, `plantuml_builder` fixes it.
Also, XML comment with description would be removed.


#### PNG

Fetch diagram as PNG:
```ruby
PlantumlBuilder::Formats::PNG.new(wsd).load
=> # diagram in PNG
```

#### TXT (ASCII-art)

```ruby
PlantumlBuilder::Formats::TXT.new(wsd).load
```
Result could be outputed as:

```
       ┌─┐                      
       ║"│                      
       └┬┘                      
       ┌┼┐                      
        │            ┌─────────┐
       ┌┴┐           │MyService│
      User           └────┬────┘
       │     perform     ┌┴┐    
       │ ───────────────>│ │    
       │                 │ │    
       │      true       │ │    
       │ <─ ─ ─ ─ ─ ─ ─ ─│ │    
      User           ┌───└┬┘───┐
       ┌─┐           │MyService│
       ║"│           └─────────┘
       └┬┘                      
       ┌┼┐                      
        │                       
       ┌┴┐
```

### Using your own server

You can also use PlantUML on your local computer, installed, or using docker image.
You need to specify endpoint:

```ruby
PlantumlBuilder::Formats::TXT.new(wsd, 'http://localhost:8080').load
```

Default endpoint is: `http://www.plantuml.com/plantuml`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/svernidub/plantuml_builder.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

