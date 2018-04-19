require 'json'

def send_notif(hostname, process)
  # Send 1st notif
  application_link = fetch(:application_link)
  address = fetch(:mattermost)
  data = {}
  data[:username] = fetch(:mattermost_username)
  data[:channel] = fetch(:mattermost_channel)
  data[:text] = "@channel #{process} deploy #{hostname}"
  execute %{curl -i -X POST -d 'payload=#{data.to_json}' #{address}}

  # Send 2nd notif
  data[:channel] = fetch(:mattermost_notify_me)
  execute %{curl -i -X POST -d 'payload=#{data.to_json}' #{address}} if data[:channel].present?
end

namespace :mattermost do
  desc 'Info start mattermost'
  task :info_start do
    on roles(:app) do |server|
      send_notif(server.hostname, "start")
    end
  end

  desc 'Info done mattermost'
  task :info_done do
    on roles(:app) do |server|
      send_notif(server.hostname, "finish")
    end
  end
end
