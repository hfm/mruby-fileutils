module FileUtils
  def pwd
    Dir.pwd
  end
  module_function :pwd

  alias getwd pwd
  module_function :getwd

  def cd(dir, options = {}, &block)
    _output_message "cd #{dir}" if options[:verbose]
    Dir.chdir(dir, &block)
    _output_message 'cd -' if options[:verbose] and block
  end
  module_function :cd

  alias chdir cd
  module_function :chdir

  def uptodate?(new, old_list)
    return false unless File.exist?(new)
    new_time = File.stat(new).mtime
    old_list.each do |old|
      if File.exist?(old)
        return false unless new_time > File.stat(old).mtime
      end
    end
    true
  end
  module_function :uptodate?

  def self._output_message(msg)
    $stderr.puts msg
  end
end
