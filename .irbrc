
require 'irb/completion'

%w[ rubygems ap interactive_editor ].each do |gem|
  begin
    require gem
  rescue LoadError
    puts "Failed to load #{gem} gem."
  end
end

# Use awesome_print as the default formatter.
if defined? AwesomePrint
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end
