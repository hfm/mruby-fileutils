MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || ".travis_build_config.rb")
MRUBY_VERSION=ENV["MRUBY_VERSION"] || "1.2.0"

file :mruby do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git"
  if MRUBY_VERSION != 'master'
    Dir.chdir('mruby') do
      sh "git fetch --tags"
      rev = `git rev-parse #{MRUBY_VERSION}`
      sh "git checkout #{rev}"
    end
  end
end

desc "compile binary"
task :compile => :mruby do
  Dir.chdir('mruby') { sh "MRUBY_CONFIG=#{MRUBY_CONFIG} rake all" }
end

desc "test"
task :test => :mruby do
  Dir.chdir('mruby') { sh "MRUBY_CONFIG=#{MRUBY_CONFIG} rake all test" }
end

desc "cleanup"
task :clean do
  Dir.chdir('mruby') { sh "rake deep_clean" }
end

task :default => :compile
