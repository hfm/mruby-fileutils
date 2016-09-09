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

  def mkdir_p(list, options = {})
    list = [list].flatten.map{|path| File.path(path)}
    _output_message "mkdir -p #{options[:mode] ? ('-m %03o ' % options[:mode]) : ''}#{list.join ' '}" if options[:verbose]
    return *list if options[:noop]

    list.map {|path| _remove_trailing_slash(path)}.each do |path|
      begin
        if options[:mode]
          Dir.mkdir dir, options[:mode]
        else
          Dir.mkdir dir
        end
        next
      rescue
        next if Dir.exists? path
      end

      stack = []
      until path == stack.last
        stack.push path
        path = File.dirname(path)
      end
      stack.reverse_each do |dir|
        begin
          if options[:mode]
            Dir.mkdir dir, options[:mode]
          else
            Dir.mkdir dir
          end
        rescue
          raise unless Dir.exists? dir
        end
      end
    end

    return *list
  end
  module_function :mkdir_p

  alias mkpath    mkdir_p
  alias makedirs  mkdir_p
  module_function :mkpath
  module_function :makedirs

  def rmdir(list, options = {})
    list = [list].flatten.map{|path| File.path(path)}
    parents = options[:parents]
    _output_message "rmdir #{parents ? '-p ' : ''}#{list.join ' '}" if options[:verbose]
    return if options[:noop]
    list.each do |dir|
      Dir.rmdir(dir = _remove_trailing_slash(dir)) if Dir.exists? dir
      if parents
        until (parent = File.dirname(dir)) == '.' or parent == dir
          dir = parent
          Dir.rmdir(dir) if Dir.exists? dir
        end
      end
    end
  end
  module_function :rmdir

  def self._output_message(msg)
    $stderr.puts msg
  end

  def self._remove_trailing_slash(dir)
    dir == '/' ? dir : dir.chomp(?/)
  end
end
