# puppet_test

This is a manifest used to learn the puppet syntax.

SOme things that could be added / corrected in this file are:
 - correct NTP entries
 - verify Hosts file
 - different environments?
 - add users and ssh keys
 - set timezone and other locales
 - set boot type (watch output of rasberry-config script)
 - configure the correct permissions on these files


 The initial steps to set up the raw devices are (this should be scripted):
  - rename host
  - add puppet server to the hosts file
  - apt-get update && apt-get upgrade
  - apt-get install puppet
  - puppet agent -t
  - sign the cert
  - rerun puppet agent -t (just to verify all is well)
