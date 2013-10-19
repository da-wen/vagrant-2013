name "webdev-php54"
description "Role for installing a PHP 5.4 runtime environment."

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
  "recipe[php::package_php54]",
  "recipe[php::fpm]",
  "recipe[php::composer]",
  "recipe[php::module_mysql]",
  "recipe[php::module_sqlite3]",
  "recipe[php::phpunit]",
  "recipe[nginx]",
  "recipe[da-wen]",
  "recipe[da-wen::nginx]",
  "recipe[da-wen::php54]",
  "recipe[da-wen::database-mysql]"
)