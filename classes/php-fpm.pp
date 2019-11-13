class php-fpm {
        package { 'php-5.4.27': 
		ensure => installed, 
	} 

        package { 'php-apc-3.1.10-4': 
		ensure => installed, 
	} 

        package { 'php-inotify-0.1.6-4': 
		ensure => installed, 
	} 

        package { 'php-memcache-2.2.7-3': 
		ensure => installed, 
	} 



	service { "php-fpm":
	      require  => Package["php-5.4.27"],
	      ensure => running,
	      enable => true,
              hasstatus => false,
	}

        file { "/etc/logrotate.d/lr_php":
                mode   => "0644",
                require => Package["php-5.4.27"],
                source => 'puppet:///nginx/lr_php',
        }


}

