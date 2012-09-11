set_default(:gmail_user) { "User" }
set_default(:gmail_password) { "Password" }

namespace :gmail do
  desc "Generate the gmail.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "gmail.yml.erb", "#{shared_path}/config/gmail.yml"
  end
  after "deploy:setup", "gmail:setup"

  desc "Symlink the gmail.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/gmail.yml #{release_path}/config/gmail.yml"
  end
  after "deploy:finalize_update", "gmail:symlink"
end
