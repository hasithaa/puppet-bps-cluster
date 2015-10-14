
import "wso2bps/common"

node 'mysql.bps.test' {
	class { 'wso2bps::common' :}
}

node 'manager.bps.test' {
	
}

node 'worker1.bps.test' {
	
}

node default {
	
}