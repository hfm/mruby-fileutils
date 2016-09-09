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

## Implemented methods

- http://docs.ruby-lang.org/ja/1.9.3/class/FileUtils.html
- http://ruby-doc.org/stdlib-1.9.3/libdoc/fileutils/rdoc/FileUtils.html
- http://ruby-doc.org/stdlib/libdoc/fileutils/rdoc/FileUtils.html

| method                    | mruby-fileutils | memo |
| ------------------------- | --------------- | ---- |
| FileUtils.#cd             | o               |      |
| FileUtils.#pwd            | o               |      |
| FileUtils.#mkdir          | o               |      |
| FileUtils.#mkdir_p        | o               |      |
| FileUtils.#rmdir          | o               |      |
| FileUtils.#ln             |                 |      |
| FileUtils.#ln_s           |                 |      |
| FileUtils.#ln_sf          |                 |      |
| FileUtils.#cp             |                 |      |
| FileUtils.#cp_r           |                 |      |
| FileUtils.#mv             |                 |      |
| FileUtils.#rm             |                 |      |
| FileUtils.#rm_r           |                 |      |
| FileUtils.#rm_rf          |                 |      |
| FileUtils.#install        |                 |      |
| FileUtils.#chmod          |                 |      |
| FileUtils.#chmod_R        |                 |      |
| FileUtils.#chown          |                 |      |
| FileUtils.#chown_R        |                 |      |
| FileUtils.#touch          |                 |      |

There are some 'low level' methods:

| method                         | mruby-fileutils | memo |
| -------------------------      | --------------- | ---- |
| FileUtils.#copy_entry          |                 |      |
| FileUtils.#copy_file           |                 |      |
| FileUtils.#copy_stream         |                 |      |
| FileUtils.#remove_entry        |                 |      |
| FileUtils.#remove_entry_secure |                 |      |
| FileUtils.#remove_file         |                 |      |
| FileUtils.#compare_file        |                 |      |
| FileUtils.#compare_stream      |                 |      |
| FileUtils.#uptodate?           | o               |      |

## License
under the MIT License:
- see [LICENSE](./LICENSE) file
