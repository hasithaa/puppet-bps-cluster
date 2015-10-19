class wso2bps::clean (
    $java_dir   = $wso2bps::params::java_dir,
    $carbon_dir   = $wso2bps::params::carbon_dir,
    )  inherits wso2bps::params {


    exec { 
        "cleaning_java":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        command   => "rm -rf {java_dir}",
        unless    => "test -d {carbon_product}-${carbon_product_version}",
    } 

    exec { 
        "cleaning_bps":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        command   => "rm -rf ${carbon_dir}/",
        unless    => "test -d {carbon_product}-${carbon_product_version}",
    } 
   
}