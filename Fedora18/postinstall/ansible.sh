#!/bin/bash
set -e -E -u -o pipefail; shopt -s failglob;

# Install ansible
yum -y install ansible
