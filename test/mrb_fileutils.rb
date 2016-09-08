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
  FileUtils.cd '/tmp', {verbose: true}
  assert_equal File.realpath('/tmp'), FileUtils.pwd
end

assert("FileUtils#uptodate?") do
  old = Tempfile.new 'old'
  oldpath = old.path
  sleep 1
  new = Tempfile.new 'new'
  newpath = new.path

  assert_true FileUtils.uptodate?(newpath, [oldpath])
  assert_false FileUtils.uptodate?(newpath, [oldpath, newpath])
end

