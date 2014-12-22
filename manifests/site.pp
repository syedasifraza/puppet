node 'htserver1.example.com' {
	file { '/tmp/hello':
	content => "Hello, World\n",
	}
        service { "sshd":
		ensure => "running",
		}
        file { '/tmp/hello1':
	content =. "Test puppet\n",
	}
}
