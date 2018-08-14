# rubocop:disable Style/RegexpLiteral, Metrics/BlockLength

def minitest_files_for(file_name, base_directory = '')
  case file_name
  when /.*_test\.rb/, /test_.*\.rb/
    ["#{base_directory}#{file_name}"]
  else
    ["#{base_directory}#{file_name}_test.rb",
     "#{base_directory}test_#{file_name}.rb"]
  end
end

scope group: :red_green_refactor

group :red_green_refactor, halt_on_fail: true do
  guard :bundler do
    watch('Gemfile')
  end

  guard :minitest, failed_mode: :keep,
                   all_after_pass: true,
                   test_folders: %w[.],
                   include: %w[lib test] do
    watch(%r{^test/test_helper\.rb$}) { 'test' }
    watch(%r{^(test/|lib/)?(.*a/)?(\w+).rb$}) do |m|
      case m[1]
      when 'test/', 'lib/'
        minitest_files_for(m[3], "./test/#{m[2]}")
      else
        minitest_files_for(m[3], './')
      end
    end
  end

  guard :rubocop do
    watch(%r{^Gemfile$})
    watch(%r{^Guardfile$})
    watch(%r{^Rakefile$})
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end

  guard :reek do
    watch(%r{.+\.rb$})
    watch('.reek')
  end

  guard :shell do
    watch(%r{(.*/)?.+\.rb$}) do |m|
      if File.file?(m[0])
        `git add #{m[0]}`
        `echo "#{m[0]} stagged in git."`
      end
    end
  end
end

# rubocop:enable Style/RegexpLiteral, Metrics/BlockLength
