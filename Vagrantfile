Vagrant::Config.run do |config|
  config.vm.box       = 'precise32'
  config.vm.box_url   = 'http://files.vagrantup.com/precise32.box'
  config.vm.host_name = 'rails-starter-box'

# 3000 - rails server
# 8888 - cas server
# 8080 - outside view of Apache Web Server

  config.vm.forward_port 3000, 3000
  config.vm.forward_port 8888, 8888
  config.vm.forward_port 80, 8080

  config.vm.provision :puppet,
    :manifests_path => 'puppet/manifests',
    :module_path    => 'puppet/modules'
end
