set :application, "fig_leaf"
set :repository, 'git@github.com:railsrumble/rr09-team-222.git/fig_leaf'
set :user, "root"
set :domain, "#{user}@97.107.138.82"
set :deploy_to, "/var/apps/fig_leaf"
set :rails_env, "production"
# set :web_command, "sudo apache2ctl"

  
namespace :vlad do
  
  remote_task :update do
    Rake::Task['vlad:after_update'].invoke
  end
  
  remote_task :after_update do
    releases[0..-7].each do |release|
      puts "Removing #{release}..."
      run "rm -rf #{deploy_to}/releases/#{release}"
      puts "Release #{release} removed"
    end
    run "chown -R www-data:www-data #{deploy_to}/current/"
  end
  
  desc "Updates your application server to the latest revision, run the migrate rake task for the the app, then restarts Passenger"
  remote_task :deploy => [:update, :migrate, :start_app]
  
end

