name "webdev-php55"
description "Role for installing a PHP 5.5 runtime environment."

default_attributes({
	"mysql" => {
	    "server_root_password" => "rootpass",
	    "server_repl_password" => "replpass",
	    "server_debian_password" => "debpass"
	}
})

override_attributes({
})

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[php::package_php55]",
  "recipe[php::fpm55]",
  "recipe[php::composer]",
  "recipe[php::module_mysql]",
  "recipe[php::module_sqlite3]",
  "recipe[php::phpunit]",
  "recipe[nginx]",
  "recipe[da-wen]",
  "recipe[da-wen::nginx]",
  "recipe[da-wen::php55]",
  "recipe[da-wen::database-mysql]"
)