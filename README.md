# puppet_test

This is a manifest used to learn the puppet syntax.

Some things that could be added / corrected in this file are:

-   correct NTP entries
-   verify Hosts file
-   different environments?
-   add users and ssh keys
-   set locales
-   set boot type (watch output of rasberry-config script)
-   configure the correct permissions on these files

    The initial steps to set up the raw devices are (this should be scripted):

-   Use pre-built image to start with system updated and agent installed
-   apt-get update && apt-get upgrade
-   apt-get install puppet

-   After initial boot with new image
-   rename host
-   puppet agent -t
-   sign the cert
-   rerun puppet agent -t (just to verify all is well)
