require 'json'
require 'httparty'

def send_notif(hostname, process)
  # Send 1st notif
  address = fetch(:mattermost)

  headers = { 'Content-Type' => 'application/json' }

  body = {}
  body[:username] = fetch(:mattermost_username)
  body[:channel] = fetch(:mattermost_channel)
  body[:text] = "@channel #{process} deploy #{hostname}"
  # execute %{curl -i -X POST -d 'payload=#{body.to_json}' #{address}}
  HTTParty.post(address, body: body.to_json, headers: headers)

  # Send 2nd notif
  body[:channel] = fetch(:mattermost_notify_me)
  # execute %{curl -i -X POST -d 'payload=#{body.to_json}' #{address}} if body[:channel] != ""
  HTTParty.post(address, body: body.to_json, headers: headers) if body[:channel] != ""
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
