# Bootstrap rails
ENV["RAILS_ENV"] = "test"
rails_path = File.expand_path(File.dirname(__FILE__) + "/../rails_test/config/environment.rb")

unless File.exists?(rails_path)
  p 'Rails not found, please run:'
  p '$ rails rails_test'
  exit
end
require rails_path

require 'test_help'
require 'pp'
require File.expand_path(File.dirname(__FILE__) +'/../init.rb') # Load browser=prof into rails_env

class SlowController < ActionController::Base
	def profile_me
		sleep 1
		render :text => "slow action"
	end
end

# Helpers
def clean_outfile
	FileUtils.rm_rf(profile_out_file)
end

def profiled?(body)
	(body =~ /browser_profile/) && (body =~ /Profile Report/)
end

def profile_out_file
	"#{RAILS_ROOT}/log/profile_out.html"
end
