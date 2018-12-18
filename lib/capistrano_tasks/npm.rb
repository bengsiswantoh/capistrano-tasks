namespace :npm do
  namespace :current do
    desc "Install depedencies within current path"
    task :install do
      on roles(:app) do
        execute "cd #{current_path} && npm install"
      end
    end

    desc "Build application within current path"
    task :run_build do
      on roles(:app) do
        execute "cd #{current_path} && npm run build"
      end
    end
  end

  namespace :release do
    desc "Install depedencies within release path"
    task :install do
      on roles(:app) do
        execute "cd #{release_path} && npm install"
      end
    end

    desc "Build application within release path"
    task :run_build do
      on roles(:app) do
        execute "cd #{release_path} && npm run build"
      end
    end
  end
end
