## Writes Cowsay command to MOTD
class cowsay_motd {
$cowsay_cmd = "/usr/local/bin/cowsay 'Welcome to ${::fqdn}!' > /etc/motd"
$cowsay_unless = '/bin/grep -F "Welcome to " /etc/motd'
exec {'cowsay_motd':
		command => $cowsay_cmd,
		unless => $cowsay_unless,
		}
	}
