name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[zsh]",
  "recipe[apt]",
  "recipe[git]",
  "recipe[ntp]",
  "recipe[htop]",
  "recipe[java]",
  "recipe[build-essential]"
)
override_attributes(
  
  :jenkins => {
    :server => {
	  :pubkey => "jnkns-clnt",
	  :host => "33.33.33.10",
	  :port => "8080"
    },
	:node  => {
      :agent_type => "ssh",
	  :ssh_pass =>"jnkns-pass",
	  :ssh_private_key =>"jnkns-prvt"
    }
  }
)



