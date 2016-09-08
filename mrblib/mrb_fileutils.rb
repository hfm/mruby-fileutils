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

  def mkdir(list, options = {})
    list = [list].flatten.map{|path| File.path(path)}
    _output_message "mkdir #{options[:mode] ? ('-m %03o ' % options[:mode]) : ''}#{list.join ' '}" if options[:verbose]
    return if options[:noop]

    list.each do |dir|
      if options[:mode]
        Dir.mkdir dir, options[:mode]
      else
        Dir.mkdir dir
      end
    end
  end
  module_function :mkdir

  def self._output_message(msg)
    $stderr.puts msg
  end
end
