class spark::master(
  $master_bind='127.0.0.1',
)
{

  require ::spark
  file { '/opt/spark/conf/spark-env.sh':
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/spark-env.sh.erb"),
    notify  => [Service['spark_master']],
  }

  file { '/usr/lib/systemd/system/spark_master.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/spark_master_service.erb"),
    notify  => [Service['spark_master']],
  }


  service{'spark_master':
    ensure => running,
    enable => true,
  }

}
