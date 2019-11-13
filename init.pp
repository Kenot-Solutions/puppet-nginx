import 'classes/*.pp'
class webserver {
    include nginx
    include php-fpm
}
