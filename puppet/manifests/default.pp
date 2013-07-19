

# create some variables for ease of updating
$main_ruby_version = 'ruby-1.9.3-p448'
$legacy_ruby_version = 'ruby-1.8.7-p370'

# Make sure apt-get -y update runs before anything else.
stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { '/usr/bin/apt-get -y update':
    user => 'root'
  }
}
class { 'apt_get_update':
  stage => preinstall
}

package { [ 'build-essential', 
'zlib1g-dev', 
'libssl-dev', 
'libreadline-dev', 
'git-core', 
'libxml2', 
'libxml2-dev', 
'libxslt1-dev',
'sqlite3',
'libsqlite3-dev']:
ensure => installed,
}

# RMagick system dependencies
package { ['libmagickwand4', 'libmagickwand-dev']:
ensure => installed,
}

class install_mysql {
  class { 'mysql': }

  class { 'mysql::server':
    config_hash => { 'root_password' => '' }
  }

  package { 'libmysqlclient15-dev':
    ensure => installed
  }
}
class { 'install_mysql': }

# class install_postgres {
#   class { 'postgresql': }

#   class { 'postgresql::server': }

#   pg_user { 'vagrant':
#     ensure    => present,
#     superuser => true,
#     require   => Class['postgresql::server']
#   }

#   package { 'libpq-dev':
#     ensure => installed
#   }
# }
# class { 'install_postgres': }



class install-rvm {
  include rvm
  rvm::system_user { vagrant: ; }

  rvm_system_ruby {
    "$main_ruby_version":
      ensure => 'present',
      default_use => false;
    "$legacy_ruby_version":
      ensure => 'present',
      default_use => false;
  }

  # Install the gems after the corresponding ruby is installed.

  rvm_gem {
    'ruby-1.9.3-p448/bundler': ensure => '1.3.5', require => Rvm_system_ruby["$main_ruby_version"];
    'ruby-1.9.3-p448/rails': ensure => '3.2.13', require => Rvm_system_ruby["$main_ruby_version"];
    'ruby-1.9.3-p448/rake': ensure => '10.1.0', require => Rvm_system_ruby["$main_ruby_version"];
#   'ruby-1.8.7-p370/bundler': ensure => latest, require => Rvm_system_ruby["$legacy_ruby_version"];
#   'ruby-1.8.7-p370/rails': ensure => latest, require => Rvm_system_ruby["$legacy_ruby_version"];;
#   'ruby-1.8.7-p370/rake': ensure => latest, require => Rvm_system_ruby["$legacy_ruby_version"];;
  }

}

class { 'install-rvm': }

# from: https://github.com/blt04/puppet-rvm
# not yet being executed

# Define and install a passenger install (probably needs work)

class {
  'rvm::passenger::apache':
    version => '3.0.11',
    ruby_version => "$main_ruby_version",
    mininstances => '3',
    maxinstancesperapp => '0',
    maxpoolsize => '30',
    spawnmethod => 'smart-lv2';
}
