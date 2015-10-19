class wso2bps::datasource (
        $version   = "3.5.0",
        $registry_db_connection_url      = undef,
        $registry_db_user                = undef,
        $registry_db_password            = undef,
        $registry_db_driver_name         = undef,
        $userstore_db_connection_url     = undef,
        $userstore_db_user               = undef,
        $userstore_db_password           = undef,
        $userstore_db_driver_name        = undef,
        $bpmn_db_connection_url          = undef,
        $bpmn_db_user                    = undef,
        $bpmn_db_password                = undef,
        $bpmn_db_driver_name             = undef,
        $bpel_db_connection_url          = undef,
        $bpel_db_user                    = undef,
        $bpel_db_password                = undef,
        $bpel_db_driver_name             = undef,
    )  inherits wso2bps::params {

	$carbon_product 	= $wso2bps::params::carbon_product
    $carbon_dir   = $wso2bps::params::carbon_dir
	$carbon_version  = $version
	$carbon_home 	 = "${carbon_dir}/${carbon_product}/${carbon_version}/${carbon_product}-${carbon_version}"

	$service_templates = [
    'conf/datasources/master-datasources.xml',
    'conf/datasources/bps-datasources.xml',
    'conf/datasources/activiti-datasources.xml',
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