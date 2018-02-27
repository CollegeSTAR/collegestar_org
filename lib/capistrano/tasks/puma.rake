namespace :puma do
  desc 'Phased restart of puma application server'
  task :phased_restart do
    on roles(:web) do
      within release_path do
        execute :bundle, "exec pumactl -F config/puma/production.rb phased-restart"
      end
    end
  end
end
