class nginx {
	package { "nginx-1.2.9": ensure => installed }

	service { "nginx":
		require  => Package["nginx-1.2.9"],
		ensure => running,
		enable => true
	}

	file {"/etc/nginx/conf.d":
	    ensure => directory
	}
	file {"/etc/nginx/global.d":
	    ensure => directory
	}
	file {"/etc/nginx/local.d":
	    ensure => directory
	}
	file {"/etc/nginx/upstream.d":
	    ensure => directory
	}

        file {"/etc/nginx/conf.d/default.conf":
            ensure => absent
        }

        file {"/etc/nginx/conf.d/example_ssl.conf":
            ensure => absent
        }


        file { "/etc/nginx/nginx.conf":
		mode   => "0644",
                require => Package["nginx-1.2.9"],
		source => 'puppet:///nginx/nginx.conf',
                notify => Service["nginx"]
       }

        file { "/etc/nginx/fastcgi_params":
		mode   => "0644",
                require => Package["nginx-1.2.9"],
		source => 'puppet:///nginx/fastcgi_params',
                notify => Service["nginx"]
       }

	file { "/etc/nginx/server_specific.conf":
		mode   => "0644",
                require => Package["nginx-1.2.9"],
		source => 'puppet:///nginx/server_specific.conf',
                notify => Service["nginx"]
       }

        file { "/etc/logrotate.d/lr_nginx":
                mode   => "0644",
                require => Package["nginx-1.2.9"],
                source => 'puppet:///nginx/lr_nginx',
       }


}
