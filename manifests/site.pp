
import 'wso2bps'

node 'mysql.bps.wso2.com' {
	#include wso2bps,

	class { '::mysql::server':
  		root_password           => 'root',
  		remove_default_accounts => true,
  		override_options        => {
									  'client' => {
									    'user' => 'root',
									    'password' => 'root',
									  }

									  'mysqld' => {
									  	'bind-address' => 'mysql.bps.wso2.com',
									  }
									}
	}
}

node 'manager.bps.wso2.com' {
	
}

node 'worker1.bps.wso2.com' {
	
}

node default {
	
}