# Capistrano task

## Install

Add this line to your application's Gemfile:

```ruby
gem 'capistrano_tasks', git: 'git@repo.dwp.io:itapps/capistrano_tasks.git'
```

## Mattermost

Add this line to Capfile

```ruby
require 'capistrano_tasks/mattermost'
```

### Options

Add options to deploy.rb

```ruby
set :mattermost, 'mattermost incoming hook' # mattermost incoming hook
set :mattermost_username, 'mattermost username' # overwrite mattermost incoming hook username
set :mattermost_channel, 'mattermost channel' #channel you want to notify
set :mattermost_notify_me, 'mattermost channel' # put blank string if you don't want to be notify ot channel you want to notify
```

### Usage

Run a remote mattermost to info start deploy with:

```bash
cap production mattermost:info_start
```

Run a remote mattermost to info done deploy with:

```bash
cap production mattermost:info_start
```

Add to deploy.rb if you want it to run when deploying app

```ruby
before :starting, "mattermost:info_start"
after :publishing, "mattermost:info_done"
```

## NPM

Add this line to Capfile

```ruby
require 'capistrano_tasks/npm'
```

### Usage

Run a remote npm install with:

```bash
cap production npm:current:install
```

Run a remote npm run build with:

```bash
cap production npm:current:run_build
```

Add to deploy.rb if you want it to run when deploying app

```ruby
before :updated, "npm:release:install"
before :updated, "npm:release:run_build"
```

## SPA

Add this line to Capfile

```ruby
require 'capistrano_tasks/spa'
```

### Options

Add options to deploy.rb

```ruby
set :spa_build_directory, 'spa build directory' # spa build directory
```

### Usage

Run a remote download .htaccess with:

```bash
cap production spa:current:download_htaccess
```

Add to deploy.rb if you want it to run when deploying app

```ruby
before :updated, "spa:release:download_htaccess"
```
