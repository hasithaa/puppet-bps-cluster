class wso2bps::clean (
    $java_dir   = $wso2bps::params::java_dir,
    $carbon_dir   = $wso2bps::params::carbon_dir,
    )  inherits wso2bps::params {

    exec {
        "killing_carbon":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        command   => "ps aux | grep -i wso2bps | awk {'print $2'} | xargs kill -9 | /bin/echo Killed";
   
        "cleaning_java":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        command   => "rm -rf ${java_dir}";
   
        "cleaning_bps":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        command   => "rm -rf ${carbon_dir}/";
    } 
   
}