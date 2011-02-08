Dir[File.dirname(__FILE__) + "/tasks/*.rake"].each { |file| load(file) }

# Register the gem release tasks in the gem namespace
GithubGem::RakeTasks.new(:gem)

# Set the RSpec runner with specdoc output as default task.
task :default => "spec:specdoc"

