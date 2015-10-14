include '::mysql::server'

class cleandb::mysql($bps_version, $user, $password, $host)
{

staging::deploy { "wso2bps-${bps_version}.zip":
  source        => "puppet:///files/packs/bps/${bps_version}/wso2am-${bps_version}.zip",
  target        => '/tmp/',
}

exec { "delete-db":
  command 	=> "/usr/bin/mysql -u$user -p$password  -e \"DROP DATABASE IF EXISTS bpmndb;DROP DATABASE IF EXISTS bpeldb;DROP DATABASE IF EXISTS regdb;DROP DATABASE IF EXISTS userdb;\"",
}

mysql::db { 'bpeldb':
    user	=> $user,
    password 	=> $password,
    host     	=> $host,
    sql 	=> "/tmp/wso2am-${bps_version}/dbscripts/bps/bpel/create/mysql.sql",
 }

 mysql::db { 'bpmndb':
    user	=> $user,
    password 	=> $password,
    host     	=> $host,
    sql 	=> "/tmp/wso2am-${bps_version}/dbscripts/bps/bpmn/create/mysql.sql",
 }

mysql::db { 'userdb':
    user  	=> $user,
    password 	=> $password,
    host     	=> $host,
    sql 	=> "/tmp/wso2am-${bps_version}/dbscripts/mysql.sql",
 }

mysql::db { 'regdb':
    user  	=> $user,
    password 	=> $password,
    host     	=> $host,
    sql 	=> "/tmp/wso2am-${bps_version}/dbscripts/mysql.sql",
 }

}
