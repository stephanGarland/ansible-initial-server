#!/bin/sh
# Ansible managed
# Alpine

# OpenSSH Server Key Re-Generation - Alpine (on first boot in new VM)
if [[ -f /etc/run-ssh-host-keygen-once ]]; then
    # remove all host keys first, so that all will be refreshed
    rm -v -f /etc/ssh/*key*
    ssh-keygen -A
    # ensure that /etc/issue gets updated with the new key
    /etc/network/if-up.d/show-ip-address update
    rm -v -f /etc/run-ssh-host-keygen-once
fi
