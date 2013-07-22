Vagrant.configure("2") do |config|
  config.vm.box       = 'rails32rsbb'
  config.vm.box_url   = 'https://dl.dropboxusercontent.com/u/4214925/vms/rails3r2rsb.box'

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file =  'default.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end
