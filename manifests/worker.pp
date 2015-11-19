class spark::worker(
  $master_host='127.0.0.1',
)
{

  require ::spark
  file { '/usr/lib/systemd/system/spark_worker.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/spark_worker_service.erb"),
    notify  => [Service['spark_worker']],
  }


  service{'spark_worker':
    ensure => running,
    enable => true,
  }

}
