#!/bin/bash
set -e -E -u -o pipefail; shopt -s failglob;

# Small bonus to help start with Linux Desktop

# Install Flash: http://fedoraproject.org/wiki/Flash
arch=$(uname -m)
if ! yum list installed adobe-release-* >/dev/null 2>&1; then
    if [[ "${arch}" == 'x86_64' ]]; then
        yum -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
    elif [[ "${arch}" == 'i386' ]] || [[ "${arch}" == 'i686' ]]; then
        yum -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
    else
        exit 1
    fi
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
fi
yum -y install flash-plugin

# Sound
## KDE - everytime when sound is needed (after each reboot): https://bugzilla.redhat.com/show_bug.cgi?id=905643
# alsactl init
## GNOME
# go System settings -> Sound  and test and choose Output
