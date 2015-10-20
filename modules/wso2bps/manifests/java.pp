class wso2bps::java (
    $java_home 	= $wso2bps::params::java,
    $java_package    = $wso2bps::params::java_package,
    $java_dir   = $wso2bps::params::java_dir,
    )  inherits wso2bps::params {


	file { "${java_dir}":
	    ensure => "directory",
	}

    # Installing Java 
	file { "${java_dir}/${java_package}":
                source => "puppet:///files/java/${java_package}",
				mode   => 0755,
			    owner  => root,
			    group  => root,
                ensure => file,
        }
    -> 
    exec { 

        "install_java":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        cwd	  => "${java_dir}",
        command   => "tar -xzf ${java_dir}/${java_package}",
        unless    => "test -d ${java_dir}/${java_home}",
        creates   => "${java_dir}/${java_home}/COPYRIGHT";

        #"changing_permissions":
        #path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        #cwd	  => "${java_dir}",
        #command   => "chown -R root:root ${java_dir}/${java_home}/; chmod -R 755 ${java_dir}/${java_home}",
        #require   => Exec["install_java"];ls 
    } 
}