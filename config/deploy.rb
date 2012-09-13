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

namespace :uploads do

  desc "copy the assets for the shared path"
  task :copy, :except => { :no_release => true } do
    run "cp -r #{release_path}/public/uploads #{shared_path}/public"
    run "rm -rf #{release_path}/public/uploads"
  end

  desc "get the assets back"
  task :get, :except => { :no_release => true } do
    run "cp -r #{shared_path}/public/uploads #{current_path}/public"
  end

  after       "deploy:finalize_update", "uploads:get"
  on :start,  "uploads:copy"

end