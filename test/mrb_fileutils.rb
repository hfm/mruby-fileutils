##
## FileUtils Test
##

assert("FileUtils") do
  assert_equal Module, FileUtils.class
  assert_equal Module, FileUtils::Verbose.class
  assert_equal Module, FileUtils::NoWrite.class
  assert_equal Module, FileUtils::DryRun.class
end

assert("FileUtils#pwd") do
  assert_equal Dir.pwd, FileUtils.pwd
  assert_equal FileUtils.pwd, FileUtils.getwd
end

assert("FileUtils#cd") do
  FileUtils.cd('/tmp', {verbose: true}) do
    assert_equal File.realpath('/tmp'), File.realpath(FileUtils.pwd)
  end
end

assert("FileUtils#uptodate?") do
  old = `mktemp /tmp/fileutils.XXXXXXXX`.chomp
  sleep 1
  new = `mktemp /tmp/fileutils.XXXXXXXX`.chomp

  assert_true FileUtils.uptodate?(new, [old])
  assert_false FileUtils.uptodate?(new, [old, new])
end

