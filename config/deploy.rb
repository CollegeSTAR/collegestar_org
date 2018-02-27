# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'collegestar_org'
set :repo_url, 'git@github.com:CollegeSTAR/collegestar_org.git'
set :branch, 'puma_migration'

#Configure rbenv
set :rbenv_type, :user
set :rbenv_ruby, '2.5.0'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/collegestar_org'

#Add puma bins to rbenv
#append :rbenv_map_bins, 'puma', 'pumactl'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/application.yml', 'public/google5642de4eaf7585a4.html')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets', 'public/ckeditor_assets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :finished, "puma:phased_restart"
end
