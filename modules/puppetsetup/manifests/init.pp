class puppetsetup (
	$deployment_pattern 	= $puppetsetup::params::deployment_pattern,
    ) inherits puppetsetup::params {

node default {

	        # Initializing deployment
	        notify {"Configuring deployment, running the default configuration, writing certnames.....": }

	        # This block will be executed only if we are triggering the deployment from puppet master
	        # If the Jenkins is controlling the cluster deployment through mCollective, then the deployment_pattern
	        # factor variable should be exported/pushed to all agent nodes by Jenkins using mCollective or other means
	        # > export FACTER_deployment_pattern=`standalone`
	        if $deployment_trig_member == 'puppet' {
	                        exec { "creating_facter_dep_pattern":
	                        path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
	                        command => "rm /etc/facter/facts.d/deployment_pattern.txt;mkdir -p /etc/facter/facts.d;echo \"deployment_pattern=`${deployment_pattern}`\" >> /etc/facter/facts.d/deployment_pattern.txt",
	                }
	        }

	        # Writing certnames to prepare the puppet agent nodes
	        file {  "/etc/puppet/puppet.conf":
	                ensure  => file,
	                content => template('wso2base/puppet.agent.conf.erb'),
	        }

	}
}
