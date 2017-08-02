#!/bin/sh
cd tests

# Test configuration dry-run
ansible-playbook -i napalm_install_config/hosts -l "*.dry_run.*" napalm_install_config/config.yaml -C
# Test configuration commit
ansible-playbook -i napalm_install_config/hosts -l "*.commit.*" napalm_install_config/config.yaml
# Test configuration errrors
ansible-playbook -i napalm_install_config/hosts -l "*.error*" napalm_install_config/config_error.yaml
# Test get_facts
ansible-playbook -i napalm_get_facts/hosts napalm_get_facts/get_facts_ok.yaml -l multiple_facts.ok
ansible-playbook -i napalm_get_facts/hosts napalm_get_facts/get_facts_not_implemented.yaml -l multiple_facts.not_implemented -e "ignore_notimplemented=true"
ansible-playbook -i napalm_get_facts/hosts napalm_get_facts/get_facts_not_implemented.yaml -l multiple_facts.not_implemented -e "ignore_notimplemented=false"
ansible-playbook -i napalm_get_facts/hosts napalm_get_facts/get_facts_error.yaml -l multiple_facts.error
