# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "togglelife"
set :repo_url, "https://github.com/thkernel/togglelife.git"
#set :ssh_options, { auth_methods: %w(password), password: "AMOSXZIBITDE88" }

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 #set :deploy_to, "/home/ubuntu/app/flirtera.net"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 append :linked_files, "config/database.yml", "config/master.key", "config/storage.yml"


# Default value for linked_dirs is []
 append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

 #set :nginx_config_name, "flirtera.net"
 #set :nginx_server_name, "flirtera.net"
 #set :puma_workers, 1

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

#set :default_env, { rvm_bin_path: '~/.rvm/bin' }


# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

=begin
set :pty, true
set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: ["~/projects/rails/flirtera/flirtera-ec2.pem"]
}
#~/projects/rails/oisepro
=end