build_directory = fetch(:spa_build_directory)

namespace :spa do
  namespace :current do
    desc "Download htaccess within current path"
    task :download_htaccess do
      on roles(:app) do
        execute "cd #{current_path}/#{build_directory} && wget https://gist.github.com/mightiesthero/2c546203392237dd13f430edbf2e1d3a/raw/.htaccess"
      end
    end
  end

  namespace :release do
    desc "Download htaccess within current path"
    task :download_htaccess do
      on roles(:app) do
        execute "cd #{release_path}/#{build_directory} && wget https://gist.github.com/mightiesthero/2c546203392237dd13f430edbf2e1d3a/raw/.htaccess"
      end
    end
  end
end
