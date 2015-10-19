$common     = hiera("nodeinfo")
$datasource = hiera("datasources")

node base {
    class { "wso2bps::clean" :} 
    ->
    class { "wso2bps::java" :} 
    ->
    class { "wso2bps::initialize" :} 
    ->
    class { "wso2bps::datasource" :
        version                         => $common[version],
        registry_db_connection_url      => $datasource[registry_db_connection_url],
        registry_db_user                => $datasource[registry_db_user],
        registry_db_password            => $datasource[registry_db_password],
        registry_db_driver_name         => $datasource[registry_db_driver_name],
        userstore_db_connection_url     => $datasource[userstore_db_connection_url],
        userstore_db_user               => $datasource[userstore_db_user],
        userstore_db_password           => $datasource[userstore_db_password],
        userstore_db_driver_name        => $datasource[userstore_db_driver_name],
        bpmn_db_connection_url          => $datasource[bpmn_db_connection_url],
        bpmn_db_user                    => $datasource[bpmn_db_user],
        bpmn_db_password                => $datasource[bpmn_db_password],
        bpmn_db_driver_name             => $datasource[bpmn_db_driver_name],
        bpel_db_connection_url          => $datasource[bpel_db_connection_url],
        bpel_db_user                    => $datasource[bpel_db_user],
        bpel_db_password                => $datasource[bpel_db_password],
        bpel_db_driver_name             => $datasource[bpel_db_driver_name],
    }
}

node /manager/ inherits base {
    $manager = hiera("manager")
      class { "wso2bps::bps":
        version                         => $common[version],
        offset                          => $manager[offset],
        depsync                         => $manager[depsync],
        clustering                      => $manager[clustering],
        local_member_port               => $manager[local_member_port],
        membershipScheme                => $manager[membershipScheme],
        cluster_domain                  => $manager[cluster_domain],
        sub_cluster_domain              => $manager[sub_cluster_domain],
        maintenance_mode                => $common[maintenance_mode],
        owner                           => $common[owner],
        group                           => $common[group],
        members                         => $manager[members],
        port_mapping                    => $manager[port_mapping],
        nodetype                        => "manager"
    }
}

