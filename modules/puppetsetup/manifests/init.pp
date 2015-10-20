class puppetsetup (
	$deployment_pattern 	= $puppetsetup::params::deployment_pattern,
    ) inherits puppetsetup::params {

node default {

            exec { "creating_facter_dep_pattern":
	                        path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
	                        command => "rm /etc/facter/facts.d/deployment_pattern.txt;mkdir -p /etc/facter/facts.d;echo \"deployment_pattern=`${deployment_pattern}`\" >> /etc/facter/facts.d/deployment_pattern.txt",
            }

	        # Writing certnames to prepare the puppet agent nodes
	        file {  "/etc/puppet/puppet.conf":
	                ensure  => file,
	                content => template('wso2bps/puppet.agent.conf.erb'),
	        }

	}
}
