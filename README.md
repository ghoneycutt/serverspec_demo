# Serverspec demo

# Steps

## To connect to a remote host

1. Move `example_roles.yaml` to `roles.yaml`
1. Replace IP with IP or hostname in `roles.yaml`
1. `bundle install`
1. `bundle exec rake acceptance`

## To use Vagrant

1. `bundle install`
1. `cd vagrant`
1. `bundle exec rake`

This will use the 'centos/7' box. If you already have a box and do not
want to download another, you may use an existing box by replacing
'centos/7' in the `Vagrantfile` with a box name of your choice. To see
what boxes you have available type `vagrant box list`.

## spec/spec_helper.rb for windows

If connecting to a Windows system, replace the contents of
`spec/spec_helper.rb` with the text below.

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
