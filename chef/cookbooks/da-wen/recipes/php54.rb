#
# Cookbook Name:: da-wen
# Recipe:: php54
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

cookbook_file "/etc/php5/cgi/php.ini" do
  source "etc/php5/cgi/php54.ini"
  owner "root"
  group "root"
  mode 0644
end

cookbook_file "/etc/php5/cli/php.ini" do
  source "etc/php5/cli/php54.ini"
  owner "root"
  group "root"
  mode 0644
end

cookbook_file "/etc/php5/fpm/php.ini" do
  source "etc/php5/fpm/php54.ini"
  owner "root"
  group "root"
  mode 0644
end

package "php5-intl" do
  action :install
end

service "php5-fpm" do%
  action :restart
end