require 'json'
file = File.read('package.json')
file_data = JSON.parse(file)

Gem::Specification.new do |s|
  s.name = file_data["name"]
  s.version = file_data["version"]
  s.description = file_data["description"]
  s.author = file_data["author"]

  s.files = `git ls-files`.split($/)
  s.require_paths = ["lib"]

  s.summary = "some task for dnet capistrano"
  s.email = 'itapps@dwp.co.id'
  s.homepage = 'https://repo.dwp.io/itapps/capistrano_tasks'
end
