##
## FileUtils Test
##

assert("FileUtils#hello") do
  t = FileUtils.new "hello"
  assert_equal("hello", t.hello)
end

assert("FileUtils#bye") do
  t = FileUtils.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("FileUtils.hi") do
  assert_equal("hi!!", FileUtils.hi)
end
