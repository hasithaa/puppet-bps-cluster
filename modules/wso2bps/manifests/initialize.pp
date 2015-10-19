class wso2bps::initialize (
    $carbon_product 	= $wso2bps::params::carbon_product,
    $carbon_product_version    = $wso2bps::params::carbon_product_version,
    $carbon_dir   = $wso2bps::params::carbon_dir,
    )  inherits wso2bps::params {


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
			    owner  => root,
			    group  => root,
                ensure => file,
        }
    -> 
    exec { 
        "installing_bps_${carbon_product}-${carbon_product_version}":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        cwd	  => "${carbon_dir}/${carbon_product}/${carbon_product_version}",
        command   => "unzip ${carbon_product}-${carbon_product_version}.zip",
        unless    => "test -d ${carbon_product}-${carbon_product_version}",
    } 

}