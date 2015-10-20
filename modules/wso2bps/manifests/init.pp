class wso2bps (
    ) inherits wso2bps::params {

    node default {
        
	        notify {"Writing certnames to prepare the puppet agent nodes": }

	        # Writing certnames to prepare the puppet agent nodes
	        file {  "/etc/puppet/puppet.conf":
	                ensure  => file,
	                content => template('wso2bps/puppet.agent.conf.erb'),
			}

			notify {"Updating Hosts": }

			$hostnames = hiera('hosts',{})

			create_resources(host, $hostnames)
	}
}
