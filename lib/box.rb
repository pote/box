module Box
  class File
    def self.caller_files(keep = 3)
      caller(1).map { |line| line.split(/:(?=\d|in )/, 3)[0,1] }.flatten
    end

    def self.inline_templates
      file = caller_files.last

      begin
        io = ::IO.respond_to?(:binread) ? ::IO.binread(file) : ::IO.read(file)
        app, data = io.gsub("\r\n", "\n").split(/^__END__$/, 2)
      rescue Errno::ENOENT
        app, data = nil
      end

      if data
        file_names = data.scan(/^@@\s*(\S*)\s*$/).flatten
        file_contents = data.split(/\n^@@.*$\n/)
        file_contents.shift
      end

      Hash[file_names.zip(file_contents)]
    end
  end

  FILES = Box::File.inline_templates
end
