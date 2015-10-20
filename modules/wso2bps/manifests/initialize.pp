class wso2bps::initialize (
    $carbon_product 	= $wso2bps::params::carbon_product,
    $carbon_product_version    = $wso2bps::params::carbon_product_version,
    $carbon_dir   = $wso2bps::params::carbon_dir,
    )  inherits wso2bps::params {


    $users = hiera("nodeinfo")

    $owner = $users[owner]
    $group = $users[group]

    group { $group:
        ensure => "present",
    }

    user { $users[owner]:
        ensure  => present,
        shell   => '/bin/bash',
        groups  => $group,
        managehome => true,
    }

	file { "${carbon_dir}":
	    ensure => "directory",
	}

	file { "${carbon_dir}/${carbon_product}":
	    ensure => "directory",
	}

	file { "${carbon_dir}/${carbon_product}/${carbon_product_version}":
	    ensure => "directory",
	}

    # Installing BPS 
	file { "${carbon_dir}/${carbon_product}/${carbon_product_version}/${carbon_product}-${carbon_product_version}.zip":
                source => "puppet:///files/packs/${carbon_product}/${carbon_product_version}/${carbon_product}-${carbon_product_version}.zip",
				mode   => 0755,
			    owner  => $owner,
			    group  => $group,
                ensure => file,
        }
    -> 
    exec { 
        "installing_bps_${carbon_product}-${carbon_product_version}":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        cwd	  => "${carbon_dir}/${carbon_product}/${carbon_product_version}",
        command   => "unzip ${carbon_product}-${carbon_product_version}.zip",
        unless    => "test -d ${carbon_product}-${carbon_product_version}";

        "setting_permission_for_${carbon_product}-${carbon_product_version}":
        path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        cwd       => "${carbon_dir}/${carbon_product}/${carbon_product_version}",
        command   => "chown -R ${owner}:${owner} ${carbon_dir}/${carbon_product}/${carbon_product_version}/${carbon_product}-${carbon_product_version} ;
                        chmod -R 755 ${carbon_dir}/${carbon_product}/${carbon_product_version}/${carbon_product}-${carbon_product_version}",
        logoutput => 'on_failure',
        timeout   => 0,
        require   => Exec["installing_bps_${carbon_product}-${carbon_product_version}"];
    } 

}