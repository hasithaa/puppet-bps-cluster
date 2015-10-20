class wso2bps::params {

    $config = hiera("config")
    
    $deployment_pattern = $config[deploymentPattern]
    $domain               = $config[domain]

    # Java
    $java_dir   = '/mnt/java'
    $java  = $config[java]
    $java_package    = $config[javaPackage]

    # WSO2BPS
    $carbon_dir   = '/mnt/carbon'
    $carbon_product  = $config[product]
    $carbon_product_version  = $config[version]
}