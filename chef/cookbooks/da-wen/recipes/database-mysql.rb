include_recipe "openssl"
include_recipe "mysql::client"
include_recipe "mysql::server"
#include_recipe "mysql::ruby"
#include_recipe "database::mysql"

processingScriptPath = "/tmp/provision-mysql"

directory processingScriptPath do
  owner "root"
  group "root"
  mode 00777
  action :create
end

execute "provision mysql-base" do
  command "bash #{processingScriptPath}/mysql-base-import.sh"
  action :nothing
end

template processingScriptPath + "/mysql-base-import.sh" do
  source "mysql-base-import.sh.erb"
  owner "root"
  group node['mysql']['root_group']
  mode "0777"
  notifies :run, "execute[provision mysql-base]", :immediately
end


execute "provision mysql-data" do
  command "bash #{processingScriptPath}/mysql-data-import.sh"
  action :nothing
end

template processingScriptPath + "/mysql-data-import.sh" do
  source "mysql-data-import.sh.erb"
  owner "root"
  group node['mysql']['root_group']
  mode "0777"
  notifies :run, "execute[provision mysql-data]", :immediately
end

# automysqlbackup
template "/usr/local/automysqlbackup.sh" do
  source "automysqlbackup.sh.erb"
  owner "root"
  group node['mysql']['root_group']
  mode "0777"
  #notifies :run, "execute[provision mysql-base]", :immediately
end

cron "automysqlbackup" do
  minute "*/20"
  command "/usr/local/automysqlbackup.sh"
end