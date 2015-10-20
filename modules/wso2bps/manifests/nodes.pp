
node base {

    class { "wso2bps::clean" :} 
    ->
    class { "wso2bps::java" :} 
    ->
    class { "wso2bps::initialize" :} 
    ->
    class { "wso2bps::datasource" :}
}

node /manager/ inherits base {
    class { "wso2bps::bps":
        nodetype                        => "manager"
    }
}

node /worker/ inherits base {
    class { "wso2bps::bps":
        nodetype                        => "worker"
    }
}

