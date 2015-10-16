# My-SQL db
# This will ONLY cleanup the databases bpeldb, bpmndb, userdb, regdb in mysql node
# This has to be triggered after each test execution
class wso2bps::common {
        $datasource = hiera("datasources")
        class { "cleandb::mysql":
          bps_version  => $common[version],
          user          => $datasource[db_root_user],
          password      => $datasource[db_root_user_password],
          host          => $datasource[host],
  		}
}

