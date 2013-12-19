#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'wirb'
Wirb.start

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

ActiveRecord::Base.logger.level = 1 if defined? ActiveRecord::Base

def y(obj)
  puts obj.to_yaml
end
