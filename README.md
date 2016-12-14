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

```ruby
# for mattermost
set :application_link, 'application link'  # "https://repo.dwp.io"
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

````ruby
before :starting, "mattermost:info_start"
after :publishing, "mattermost:info_done"
```
