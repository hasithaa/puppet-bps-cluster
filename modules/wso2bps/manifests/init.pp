class wso2bps (
	$deployment_pattern 	= $puppetsetup::params::deployment_pattern,
    ) inherits wso2bps::params {


    node default {
        
	        notify {"Configuring deployment, running the default configuration, writing certnames.....": }

	        # Writing certnames to prepare the puppet agent nodes
	        file {  "/etc/puppet/puppet.conf":
	                ensure  => file,
	                content => template('wso2bps/puppet.agent.conf.erb'),
			}

			$hostnames = hiera('hostnames',{})

			create_resources(host, $hostnames)
	}
}
