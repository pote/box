module Box
  class File
    def self.caller_files(keep = 3)
      ## Here there be dragons.
      caller(1).map { |line| line.split(/:(?=\d|in )/, 3)[0,1] }.flatten
    end

    def self.inline_templates
      prioritized_callers = caller_files.reverse

      ## ARGH, loops! I'm sorry.
      loop do
        file = prioritized_callers.shift

        begin
          io = ::IO.respond_to?(:binread) ? ::IO.binread(file) : ::IO.read(file)
          app, @data = io.gsub("\r\n", "\n").split(/^__END__$/, 2)
        rescue Errno::ENOENT
          app, @data = nil
        end

        break if @data || prioritized_callers.empty?
      end

      if @data
        file_names = @data.scan(/^@@\s*(\S*)\s*$/).flatten
        file_contents = @data.split(/\n^@@.*$\n/)
        file_contents.shift
      end

      unless file_names.nil?
        Hash[file_names.zip(file_contents)]
      else
        {}
      end
    end
  end

  FILES = Box::File.inline_templates
end
