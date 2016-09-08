# mruby-fileutils [![Build Status](https://travis-ci.org/hfm/mruby-fileutils.svg?branch=master)](https://travis-ci.org/hfm/mruby-fileutils)

Several file utility methods for copying, moving, removing, etc. The aim for this project is a port of [FileUtils](http://docs.ruby-lang.org/en/trunk/FileUtils.html) to [mruby](https://github.com/mruby/mruby).

## install by mrbgems

- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'hfm/mruby-fileutils'
end
```
## example
```ruby
p FileUtils.hi
#=> "hi!!"
t = FileUtils.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
