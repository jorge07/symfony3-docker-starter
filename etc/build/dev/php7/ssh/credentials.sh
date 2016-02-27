#!/usr/bin/env bash

echo "Copying ssh and fixing permissions..."

cp -R /root/ssh /root/.ssh
chmod 700 /root/.ssh

echo "Done"

exit 0
