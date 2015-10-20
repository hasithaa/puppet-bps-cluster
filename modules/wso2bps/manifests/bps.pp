class wso2bps::bps (
        $nodetype                        =  undef,
    )  inherits wso2bps::params {

    $carbon_product     = $wso2bps::params::carbon_product
    $carbon_dir   = $wso2bps::params::carbon_dir
    $carbon_version  = $wso2bps::params::carbon_product_version
    $carbon_home     = "${carbon_dir}/${carbon_product}/${carbon_version}/${carbon_product}-${carbon_version}"

    $common     = hiera("nodeinfo")

    if ($nodetype == "manager") {
        $bpsConfig     = hiera("manager")
    }

    if ($nodetype == "worker") {
        $bpsConfig     = hiera("worker")
    }

    $offset =  $bpsConfig[offset]
    $depsync  =  $bpsConfig[depsync]
    $clustering =  $bpsConfig[clustering]
    $local_member_port  =  $bpsConfig[local_member_port]
    $membershipScheme =  $bpsConfig[membershipScheme]
    $cluster_domain =  $bpsConfig[cluster_domain]
    $sub_cluster_domain =  $bpsConfig[sub_cluster_domain]
    $maintenance_mode =  $common[maintenance_mode]
    $owner  =  $common[owner]
    $group  =  $common[group]
    $members  =  $bpsConfig[members]
    $port_mapping =  $bpsConfig[port_mapping]

    # Performace and BPS related configuration
    $perfConfig     = hiera("perfConfig")

    $odeTimeout  = $perfConfig[odeTimeout] 
    $odeSchedulerThread  = $perfConfig[odeSchedulerThread]
    $maxHttpConnections  = $perfConfig[maxHttpConnections] 
    $perHostHttpConnections  = $perfConfig[perHostHttpConnections] 
    $htSchedulerThread  = $perfConfig[htSchedulerThread]
    $taskCoordination  = $perfConfig[taskCoordination] 
    $taskCaching  = $perfConfig[taskCaching] 

    $hostnames = hiera('hostnames',{})


	$service_templates = [
    'conf/axis2/axis2.xml',
    'conf/carbon.xml',
    'conf/registry.xml',
    'conf/user-mgt.xml',
	'conf/bps.xml',
	'conf/humantask.xml',
	'conf/b4p-coordination-config.xml',
    ]

    wso2bps::push_templates  {
	    $service_templates:
	      target    => $carbon_home,
	      directory => "${carbon_product}/${carbon_version}",
	      owner     => $owner,
	      group     => $group,
	      require   => Exec["installing_bps_${carbon_product}-${carbon_version}"],
  	}
}