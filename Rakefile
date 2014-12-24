SSH = 'ssh -A -i /root/.ssh/id_rsa -l root'
REPO = 'git@github.com:syedasifraza/puppet.git'

desc "Bootstrap Puppet on ENV['CLIENT'] with ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  commands = <<BOOTSTRAP
hostname #{hostname} && echo 150.183.236.175 #{hostname} >/etc/hosts && cd /etc/yum.repos.d/ && rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm && rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && yum install -y git puppet && rm -rf /etc/puppet/* && git clone #{REPO} /etc/puppet/ && puppet apply --modulepath=/etc/puppet/modules /etc/puppet/manifests/site.pp 
BOOTSTRAP
sh "#{SSH} #{client} '#{commands}'"
end
