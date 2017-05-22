# Serverspec demo

# Steps

1. Move `example_roles.yaml` to `roles.yaml`
1. Replace IP with IP or hostname in `roles.yaml`
1. `bundle install`
1. `bundle exec rake acceptance`

## spec/spec_helper.rb for windows

```
require 'serverspec'
require 'winrm'

set :backend, :winrm

user = ENV['SERVERSPEC_USER']
pass = ENV['SERVERSPEC_PASSWORD']
endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"
puts "endpoint is #{endpoint}"

winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user,
:pass => pass, :basic_auth_only => true)
winrm.set_timeout 300 # 5 minutes max timeout for any operation
Specinfra.configuration.winrm = winrm
```
