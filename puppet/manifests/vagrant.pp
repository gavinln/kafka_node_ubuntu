#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class {
    init: ;
    timezone: timezone => 'US/Pacific-New';
    python_setup:;
    ohmyzsh_setup:;
    javascript:;
    docker: require => Class[init];
}


