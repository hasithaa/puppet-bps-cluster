class wso2bps::params {

    $domain               = "bps.wso2.com"
    $depsync_svn_repo     = "http://svn.${domain}/svn/amdepsync"
    $local_package_dir    = "/mnt/packs"
    $hosts_mapping = [  
                        "172.16.115.133,puppetmaster puppet",
                        "172.16.115.134,mysql.bps.wso2.com",
                    ]

    # Java
    $java_home  = "jdk1.8.0_45"
    $package    = "jdk-8u45-linux-x64.tar.gz"
    $java_dir   = '/mnt/java'

    # maven
    $maven_package  ="apache-maven-3.0.5-bin.tar.gz"
    $maven_dir      ="apache-maven-3.0.5" 

}