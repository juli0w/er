set_default(:rescue_starter) { "/home/#{user}/bin/start_resque_worker.sh" }

namespace :resque do
  desc "Generate the binary file."
  task :setup, roles: :app do
    run "mkdir -p /home/#{user}/bin"
    template "start_resque_worker.sh.erb", rescue_starter
    run "#{sudo} chmod +x #{rescue_starter}"

    run "cd #{deploy_to}/current && PATH=/home/deployer/.rbenv/bin:/home/deployer/.rbenv/shims:$PATH RAILS_ENV=production bundle exec rake resque:setup"
  end
  after "deploy:setup", "resque:setup"
end
