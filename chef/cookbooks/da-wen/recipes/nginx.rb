#
# Cookbook Name:: da-wen
# Recipe:: nginx
#
# Copyright 2013, da-wen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cookbook_file "/etc/nginx/sites-available/001-webdev" do
  source "etc/nginx/sites-available/001-webdev"
  owner "root"
  group "root"
  mode 0644
end

cookbook_file "/etc/nginx/sites-available/002-symfony2" do
  source "etc/nginx/sites-available/002-symfony2"
  owner "root"
  group "root"
  mode 0644
end

nginx_site '001-webdev' do
  enable true
end

nginx_site '002-symfony2' do
  enable true
end

directory "/vagrant/www/default" do
  owner "root"
  group "root"
  mode 00777
  action :create
end

cookbook_file "/vagrant/www/default/index.php" do
  source "vagrant/www/default/index.php"
  owner "vagrant"
  group "vagrant"
  mode 0777
end
