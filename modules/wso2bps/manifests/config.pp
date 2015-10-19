class wso2bps::config (
    $carbon_home 	=  undef,
    $carbon_product_version    = $wso2bps::params::carbon_product_version,
    )  inherits wso2bps::params {

    file { "${carbon_home}/repository/conf/axis2/axis2.xml":
        ensure => "file",
        content => template("wso2bps/${carbon_product_version}/conf/axis2/axis2.xml.erb"),
    }

}