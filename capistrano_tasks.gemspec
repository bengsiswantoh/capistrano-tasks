require 'json'
file = File.read('package.json')
file_data = JSON.parse(file)

Gem::Specification.new do |s|
  s.name = 'capistrano_tasks'
  s.version = '0.0.1'
  s.description = 'some task for dnet capistrano'
  s.authors = 'itapps'
  s.summary = "some task for dnet capistrano"
  s.email = 'itapps@dwp.co.id'
  s.homepage = 'https://repo.dwp.io/itapps/capistrano_tasks'
end
