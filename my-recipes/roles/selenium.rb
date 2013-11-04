name "selenium"
description "Selenium slave node"
run_list(
  "role[base]",	
  "recipe[xvfb]",
  "recipe[jenkins::node]"
)
override_attributes(
    :jenkins => {
    :server => {
	  :pubkey => "vagrant",
	  :host => "33.33.33.10",
	  :port => "8080",
	  :url => "http://33.33.33.10:8080"
    },
	:node  => {
      :agent_type => "ssh",
	  :ssh_pass =>"vagrant",
	  :ssh_private_key =>"vagrant"
    }
  }
)