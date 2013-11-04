name "master"
description "Jenkins server"
run_list(
  "role[base]",	
  "recipe[jenkins::server]"
)
override_attributes(
    
)