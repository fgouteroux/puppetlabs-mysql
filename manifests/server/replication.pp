define mysql::server::replication ($service_username,
                                   $service_password,
                                   $mysql_master,
                                   $root_password) {

  $config = "/usr/local/sbin/mysql-replication.sh"

  file { $config:
    ensure  => $ensure,
    mode    => '0700',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/mysql-replication.sh.erb"),
    require => Class['mysql::server::config'],
  }
  exec { $config:
    path => ["/usr/bin", "/usr/sbin"]
  }

}

