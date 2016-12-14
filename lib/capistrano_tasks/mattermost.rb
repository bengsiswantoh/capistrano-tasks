require 'json'

namespace :mattermost do
  desc 'Info start mattermost'
  task :info_start do
    on roles(:app) do
      application_link = fetch(:application_link)
      address = fetch(:mattermost)
      data = {}
      data[:username] = fetch(:mattermost_username)
      data[:channel] = fetch(:mattermost_channel)
      data[:text] = "@channel start deploy #{application_link} "
      json = data.to_json
      execute %{curl -i -X POST -d 'payload=#{json}' #{address}}
      data[:channel] = fetch(:mattermost_notify_me)
      if data[:channel] != ""
        json = data.to_json
        execute %{curl -i -X POST -d 'payload=#{json}' #{address}}
      end
    end
  end

  desc 'Info done mattermost'
  task :info_done do
    on roles(:app) do
      application_link = fetch(:application_link)
      address = fetch(:mattermost)
      data = {}
      data[:username] = fetch(:mattermost_username)
      data[:channel] = fetch(:mattermost_channel)
      data[:text] = "@channel done deploy #{application_link}"
      json = data.to_json
      execute %{curl -i -X POST -d 'payload=#{json}' #{address}}
      data[:channel] = fetch(:mattermost_notify_me)
      if data[:channel] != ""
        json = data.to_json
        execute %{curl -i -X POST -d 'payload=#{json}' #{address}}
      end
    end
  end
end
