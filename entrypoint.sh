#!/bin/bash

./james start

sleep 30

./james-cli.sh -h localhost adddomain $JAMES_DOMAIN
./james-cli.sh -h localhost adduser $JAMES_USER $JAMES_PASSWORD
