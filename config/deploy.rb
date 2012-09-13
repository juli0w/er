require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "juliobudal.com", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "expresso"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:juli0w/er.git"
set :branch, "master"

set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :assets do
  task :symlink, :roles => :app do
    assets.create_dir
    run <<-CMD
      rm -rf  #{release_path}/public/uploads &&
      ln -nfs #{shared_path}/uploads #{release_path}/public/uploads
    CMD
  end

  task :create_dir, :roles => :app do
    run "mkdir -p #{shared_path}/uploads"
  end
end