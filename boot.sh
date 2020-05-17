#!/bin/bash

# GUI RPC CONFIG
echo $BOINC_GUI_RPC_PASSWORD > /etc/boinc-client/gui_rpc_auth.cfg
echo $BOINC_REMOTE_HOST > /etc/boinc-client/remote_hosts.cfg

boinc $BOINC_CMD_LINE_OPTIONS
