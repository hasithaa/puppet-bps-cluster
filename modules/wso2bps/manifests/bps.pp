class wso2bps::bps (
        $version   = "3.5.0",
        $offset    = 0,
        $depsync   = false,
        $clustering    = false,
        $local_member_port   = undef,
        $membershipScheme    = undef,
        $cluster_domain      = undef,
        $sub_cluster_domain  = undef,
        $maintenance_mode    = true,
        $owner               = "root",
        $group               = "root",
        $members             = {'127.0.0.1' => '4000'},
        $port_mapping                    = undef,
        $nodetype                        =  undef,
    )  inherits wso2bps::params {

	$carbon_product 	= $wso2bps::params::carbon_product
    $carbon_dir   = $wso2bps::params::carbon_dir
	$carbon_version  = $version
	$carbon_home 	 = "${carbon_dir}/${carbon_product}/${carbon_version}/${carbon_product}-${carbon_version}"

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
	      directory => "${carbon_product}/${version}",
	      owner     => $owner,
	      group     => $group,
	      require   => Exec["installing_bps_${carbon_product}-${carbon_version}"],
  	}
}