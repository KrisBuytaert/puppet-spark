class spark (
  $spark_package='apache-spark',
  $spark_version='1.5.1-1',
)
{
  # This module will set up a basic spark cluster, a master node and multiple slaves connecting to this master.
  # We assume an EL7 based stack  with a rpm available in a yum repo.
  # The current rpm has been build with   fpm -s dir -t rpm -n apache-spark -v 1.5.1 -a noarch /opt/spark/
  #

  notify {'Including spark':}
  package { "${spark_package}":
    ensure => "${spark_version}",
  }


}


