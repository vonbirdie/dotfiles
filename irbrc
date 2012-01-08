# http://blog.nicksieger.com/articles/2006/04/23/tweaking-irb
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# reload this .irbrc
def IRB.reload
  load __FILE__
end
