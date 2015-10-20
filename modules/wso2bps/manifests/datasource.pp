class wso2bps::datasource ()  inherits wso2bps::params {

	$carbon_product 	= $wso2bps::params::carbon_product
    $carbon_dir   = $wso2bps::params::carbon_dir
	$carbon_version  = $wso2bps::params::carbon_product_version
	$carbon_home 	 = "${carbon_dir}/${carbon_product}/${carbon_version}/${carbon_product}-${carbon_version}"

    $datasource = hiera("datasources")

    $registry_db_connection_url     = $datasource[registry_db_connection_url]
    $registry_db_user               = $datasource[registry_db_user]
    $registry_db_password           = $datasource[registry_db_password]
    $registry_db_driver_name        = $datasource[registry_db_driver_name]
    $userstore_db_connection_url    = $datasource[userstore_db_connection_url]
    $userstore_db_user              = $datasource[userstore_db_user]
    $userstore_db_password          = $datasource[userstore_db_password]
    $userstore_db_driver_name       = $datasource[userstore_db_driver_name]
    $bpmn_db_connection_url         = $datasource[bpmn_db_connection_url]
    $bpmn_db_user                   = $datasource[bpmn_db_user]
    $bpmn_db_password               = $datasource[bpmn_db_password]
    $bpmn_db_driver_name            = $datasource[bpmn_db_driver_name]
    $bpel_db_connection_url         = $datasource[bpel_db_connection_url]
    $bpel_db_user                   = $datasource[bpel_db_user]
    $bpel_db_password               = $datasource[bpel_db_password]
    $bpel_db_driver_name            = $datasource[bpel_db_driver_name]


	$service_templates = [
        'conf/datasources/master-datasources.xml',
        'conf/datasources/bps-datasources.xml',
        'conf/datasources/activiti-datasources.xml',
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