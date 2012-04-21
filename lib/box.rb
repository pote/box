module Box
  class File
    def self.load
      files = {}

      if defined?(DATA)
        DATA.read.split(/^@@ /).each do |chunk|
          if chunk != ""
            file_name = chunk.match(/(\A\w+.\w+)/)[0]
            file_content = chunk.split(/\A\w+.\w+\n/)[1]

            files[file_name] = file_content
          end
        end
      end

      files
    end
  end

  FILES = Box::File.load
end
