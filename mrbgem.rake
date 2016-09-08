MRuby::Gem::Specification.new('mruby-fileutils') do |spec|
  spec.license = 'MIT'
  spec.authors = 'OKUMURA Takahiro'

  spec.add_dependency 'mruby-io'
  spec.add_dependency 'mruby-dir'
  spec.add_dependency 'mruby-file-stat'
  spec.add_test_dependency 'mruby-sleep'
end
