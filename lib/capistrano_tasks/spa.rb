def download_htaccess(path)
  build_directory = fetch(:spa_build_directory)
  file = "https://gist.github.com/mightiesthero/2c546203392237dd13f430edbf2e1d3a/raw/.htaccess"

  execute "cd #{path}/#{build_directory} && wget #{file}"
end

namespace :spa do
  namespace :current do
    desc "Download htaccess within current path"
    task :download_htaccess do
      on roles(:app) do
        download_htaccess(current_path)
      end
    end
  end

  namespace :release do
    desc "Download htaccess within current path"
    task :download_htaccess do
      on roles(:app) do
        download_htaccess(release_path)
      end
    end
  end
end
