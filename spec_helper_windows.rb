require 'serverspec'
require 'winrm'

set :backend, :winrm

user = ENV['SERVERSPEC_USER']
pass = ENV['SERVERSPEC_PASSWORD']
endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"
puts "endpoint is #{endpoint}"

winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true)
winrm.set_timeout 300 # 5 minutes max timeout for any operation
Specinfra.configuration.winrm = winrm
