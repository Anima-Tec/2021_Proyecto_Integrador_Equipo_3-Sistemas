#!/bin/bash
if [ "$(hostname -i)" = "10.1.11.235" ]
then
  ./control_center.sh
[else
  echo "This script cannot be executed on this server."]
  export unAuthorisedSystem="This system executes the script without owner permissions"
fi
