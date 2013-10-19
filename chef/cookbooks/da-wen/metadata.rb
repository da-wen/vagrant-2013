maintainer       "da-wen"
maintainer_email "secret"
license          "Apache 2.0"
description      "Installation of a simple webdev environment"
version          "1.0.0"

recipe            "da-wen", "default installation and cunfiguration"

%w{ ubuntu }.each do |os|
  supports os
end
